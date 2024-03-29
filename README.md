1. Docker \

   ```console
   # Show the IP Address
   hostname -I

   # List all docker images
   docker images

   # List all currently running containers
   docker ps

   # Build the docker image
   docker build -t keypad .
   docker build -t flasktest2 .

   # Run the docker image
   docker run --device /dev/gpiomem -p 8000:8000 flasktest2
   ```

   Other commands
   ```console
   # Stop a currently running container
   docker stop <container-name>

   # Delete unused Docker objects (containers, images, networks, volumes)
   docker container prune

   # To delete all containers including its volumes use
   docker rm -vf $(docker ps -aq)

   # To delete all volumes
   docker volume rm $(docker volume ls -q)

   # To delete all the images
   docker rmi -f $(docker images -aq)

   # Command to clean all containers, images, volumes, networks, and undefined containers created with docker-compose
   docker-compose down --rmi all -v --remove-orphans

   # Builds, (re)creates, starts containers
   docker-compose up --build
   # Stop all containers
   docker-compose down

   # Connect to SQL container
   docker-compose exec db psql -h localhost -U supermario --dbname=keypad

   # Reset Masterpassword
   UPDATE parameter SET password = NULL, initialized = FALSE;

   # See table parameter/loginfo
   SELECT * FROM parameter;
   SELECT * FROM loginfo;
   ```

   Probleme \
   Folgendes musste in die Docker Compose Datei eingebaut werden. Ansonsten geht der Zugriff auf die GPIO nicht. \
   https://www.gerbenvanadrichem.com/infrastructure/accessing-gpio-pins-inside-a-docker-container-on-a-raspberry-pi/

2. THREAD \
   https://unbiased-coder.com/python-flask-multithreading/ \
   https://www.section.io/engineering-education/how-to-perform-threading-timer-in-python/

3. DIVERS \
   Die Session kann komplett geleert werden mit:
   ```
   session.clear
   ```

   Man kann auch ein Objekt in der Session entfernen mit:
   ```
   session.pop('Name', None)
   ```

   Arbeiten mit einer ENV-Datei \
   Es kommt kein SECRET Code in den Source-Code und auch nicht nach GIT \
   Zu Beginn mit python-dotenv gearbeitet und dann aber nach python-decouple gewechselt. \
   Der große Vorteil ist die CAST Methode. \
   Im folgenden Artikel steht unter anderem: \
   The casting and the ability to specify defaults are really convenient and something I miss when using python-dotenv! \
   https://pybit.es/articles/how-to-handle-environment-variables-in-python/

   bcrypt \
   https://stackabuse.com/hashing-passwords-in-python-with-bcrypt/

4. Postgres \
   https://medium.com/free-code-camp/docker-development-workflow-a-guide-with-flask-and-postgres-db1a1843044a