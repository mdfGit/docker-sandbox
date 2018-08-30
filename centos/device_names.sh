for disk in $(lsblk -l | grep disk | awk '{print $1}'|egrep -v xvdc); do
  echo h 	
done
