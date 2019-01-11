# Wait for x seconds then clear
waiter() {
  echo "Waiting for $1 seconds"
  sleep $1
  clear
}
