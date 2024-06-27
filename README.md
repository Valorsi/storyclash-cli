Welcome to my (Boris') cli tool!

Here, i'll be documenting the steps i took to make this tool work!


1) Install PhP on your system. The version i used was 8.1.12

2) Install Xampp and create the Databases in MariaDB using the database.sql and dev_database.sql file, then execute the dummy_data.sql file into the "prod" database.

3) run php copy.php with your preferred options
    -> --only=$source or -o=$source ($source is tiktok or instagram, on default all sources are selected)
    -> --include_posts=$limit or -i=$limit ($limit is the amount of posts selected, on default none are selected)
    -> $feedId (an integer always used as the last argument, selects the corresponding feedId and its sources. This one is not optional.)
    -> example command: php copy.php -o=tiktok -i=2 5

4) For testing, make sure to have composer and phpunit installed

5) run php phpunit.phar tests