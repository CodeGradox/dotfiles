# Top-like interface for container metrics.
# ctop provieds a concise and condensed overview of real-life metrics for multiple containers.
function ctop --description="Top-like interface for container metrics."
  sudo docker run --rm -ti \
    --name=ctop \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    quay.io/vektorlab/ctop:latest
end

