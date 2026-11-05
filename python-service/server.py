
from http.server import BaseHTTPRequestHandler, HTTPServer
import json

class HealthHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/health":
            response = {"status": "ok"}
            status_code = 200
        elif self.path == "/":
            response = {
                "service": "YFF IT Infrastructure Lab",
                "status": "running"
            }
            status_code = 200
        else:
            response = {"error": "Not found"}
            status_code = 404

        data = json.dumps(response).encode("utf-8")

        self.send_response(status_code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

server = HTTPServer(("0.0.0.0", 8000), HealthHandler)

print("Starting IT Service Health Monitor on port 8000...", flush=True)

try:
    server.serve_forever()
except KeyboardInterrupt:
    print("\nServer stopped by administrator.")
finally:
    server.server_close()
