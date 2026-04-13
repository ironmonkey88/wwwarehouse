# [ARCHITECT] Public Civic Pulse - Infrastructure Gateway 🏮

# 1. GCS Bucket for Static Hosting
resource "google_storage_bucket" "portal_bucket" {
  name          = "civicpulse-somerville-io"
  location      = var.region
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  cors {
    origin          = ["*"]
    method          = ["GET", "HEAD", "OPTIONS"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

# 2. Make Bucket Publicly Readable (for Load Balancer)
resource "google_storage_bucket_iam_member" "public_read" {
  bucket = google_storage_bucket.portal_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

# 3. Global Static External IP for the Portal
resource "google_compute_global_address" "portal_ip" {
  name = "portal-static-ip"
}

# 4. Global Managed SSL Certificate
resource "google_compute_managed_ssl_certificate" "portal_cert" {
  name = "portal-managed-cert-v4"

  managed {
    domains = [var.portal_domain]
  }

  lifecycle {
    create_before_destroy = true
  }
}

# 5. Backend Bucket for Load Balancer
resource "google_compute_backend_bucket" "portal_backend" {
  name        = "portal-backend"
  description = "Backend bucket for the public civic pulse static site"
  bucket_name = google_storage_bucket.portal_bucket.name
  enable_cdn  = true
}

# 6. URL Map (The Routing Core)
resource "google_compute_url_map" "portal_url_map" {
  name            = "portal-url-map"
  default_service = google_compute_backend_bucket.portal_backend.self_link
}

# 7. HTTPS Target Proxy
resource "google_compute_target_https_proxy" "portal_https_proxy" {
  name             = "portal-https-proxy"
  url_map          = google_compute_url_map.portal_url_map.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.portal_cert.self_link]
}

# 8. Global Forwarding Rule (The Entry Point)
resource "google_compute_global_forwarding_rule" "portal_forwarding_rule" {
  name       = "portal-https-forwarding-rule"
  target     = google_compute_target_https_proxy.portal_https_proxy.self_link
  port_range = "443"
  ip_address = google_compute_global_address.portal_ip.address
}

# 9. HTTP to HTTPS Redirect (Security Best Practice)
resource "google_compute_url_map" "redirect_url_map" {
  name = "portal-redirect-url-map"

  default_url_redirect {
    https_redirect = true
    strip_query    = false
  }
}

resource "google_compute_target_http_proxy" "redirect_proxy" {
  name    = "portal-http-proxy"
  url_map = google_compute_url_map.redirect_url_map.self_link
}

resource "google_compute_global_forwarding_rule" "redirect_forwarding_rule" {
  name       = "portal-http-forwarding-rule"
  target     = google_compute_target_http_proxy.redirect_proxy.self_link
  port_range = "80"
  ip_address = google_compute_global_address.portal_ip.address
}

# [OUTPUT] The IP Address for DNS Configuration
output "portal_public_ip" {
  value = google_compute_global_address.portal_ip.address
}
