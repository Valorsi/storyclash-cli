<?php

class Post {
    protected $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getPostsByFeedId($feedId, $limit) {
        
        $sql = 'SELECT * FROM 
                posts AS p
                WHERE p.feed_id = :id
                LIMIT 5';

        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':id', $feedId);
        //$stmt->bindValue(':amount', $limit);
        $stmt->execute();
        $result = $stmt->fetchAll();

        return $result;
    }

    public function insertPost($postId, $feedId, $url) {
        $sql = 'INSERT INTO posts 
                (
                    feed_id,
                    `url`
                )
                VALUES
                (
                    :feedId,
                    :url
                )';

        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':feedId', $feedId);
        $stmt->bindValue(':url', $url);

        try {
            $stmt->execute();
        } catch (PDOException $e) {
            echo $e;
            $this->db->setError();
        }

    }
}