<?php

class Database {
    protected $pdo;

    public $isError;

    public function __construct($dbname = 'storyclash') {
        $dsn = 'mysql:host=localhost;dbname='.$dbname.';charset=utf8';
        $username = 'root'; // Change this to your database username
        $password = ''; // Change this to your database password
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ];

        $this->isError = false;
        
        try {
            $this->pdo = new PDO($dsn, $username, $password, $options);
        } catch (PDOException $e) {
            die('Database connection failed: '. $e->getmessage());
        }
        
    }

    public function beginTransaction() {
        $this->pdo->beginTransaction();
    }

    public function commit() {
        $this->pdo->commit();
    }

    public function rollback() {
        $this->pdo->rollback();
    }

    public function prepare($sql) {
        return $this->pdo->prepare($sql);
    }

    public function setError() {
        $this->isError = true;
    }

}