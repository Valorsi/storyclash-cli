<?php

class Feed {

    protected $db;
    
    public function __construct($db) {
        $this->db = $db;
    }

    public function getFeed($feedId) {
        $sql = 'SELECT * FROM feeds WHERE id = :id';
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['id' => $feedId]);
        $result = $stmt->fetch();

        return $result;
    }

    public function insertFeed($feedId, $feedName) {
        $sql = 'INSERT INTO feeds 
                (
                    id,
                    `name`
                )
                VALUES
                (
                    :id,
                    :name
                )';

        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':id', $feedId);
        $stmt->bindValue(':name', $feedName);

        try {
            $stmt->execute();
        } catch (PDOException $e) {
            echo $e;
            $this->db->setError();
        }

    }

}