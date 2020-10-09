## To run this project
1. Install docker (for Mac https://docs.docker.com/docker-for-mac/install/) 
2. Install docker-compose (https://docs.docker.com/compose/install/)
3. Start docker
4. Navigate to the root of the project.
5. Run `docker-compose up`
6. Visit localhost:8080/installer to setup wallacePOS and use the following credentials:
  - Host: mysql-server
  - Port: 3306 (Careful, it might be in use already!)
  - Database: wallacepos
  - Usename: root
  - Password: Xy8p8zOar17y

7. Follow the installer instructions.
8. In case the WallacePOS is already initialized (installer already ran), use:
  username: admin
  password: testtest

  to login into WallacePOS!!

To shut down WallacePOS, run `docker-compose down`


Good luck!