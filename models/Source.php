<?php

class Source {
    
    protected $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getTiktokSources($feedId) {
        $sql = 'SELECT
                fts.tiktok_source_id,
                ts.fan_count,
                ts.name 
                FROM 
                feeds AS f
                JOIN feeds_tiktok_sources AS fts
                    ON f.id = fts.feed_id
                JOIN tiktok_sources AS ts
                    ON fts.tiktok_source_id = ts.id
                WHERE f.id = :id';


        $stmt = $this->db->prepare($sql);
        $stmt->execute(['id' => $feedId]);
        $result = $stmt->fetchAll();
        
        return $result;
    }

    public function getInstagramSources($feedId) {
        $sql = 'SELECT 
                fis.instagram_source_id, 
                ins.fan_count,
                ins.name
                FROM 
                feeds AS f
                JOIN feeds_instagram_sources AS fis
                    ON f.id = fis.feed_id
                JOIN instagram_sources AS ins
                    ON fis.instagram_source_id = ins.id
                WHERE f.id = :id';

        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':id', $feedId);
        $stmt->execute();
        $result = $stmt->fetchAll();

        return $result;
    }

    public function insertTiktokSource($feedId, $sourceId, $fanCount, $name){
        $sourceSql = 'INSERT INTO tiktok_sources 
        (
            id,
            fan_count,
            `name`
        )
        VALUES
        (
            :id,
            :fanCount,
            :name
        )';

        $stmt = $this->db->prepare($sourceSql);
        $stmt->bindValue(':id', $sourceId);
        $stmt->bindValue(':fanCount', $fanCount);
        $stmt->bindValue(':name', $name);

        try {
            $stmt->execute();
        } catch (PDOException $e) {
            echo $e;
            $this->db->setError();
        }

        $mmSql = 'INSERT INTO feeds_tiktok_sources 
        (
            feed_id,
            tiktok_source_id
        )
        VALUES
        (
            :feedId,
            :sourceId
        )';

        $stmt = $this->db->prepare($mmSql);
        $stmt->bindValue('feedId', $feedId);
        $stmt->bindValue('sourceId', $sourceId);

        try {
            $stmt->execute();
        } catch (PDOException $e) {
            echo $e;
            $this->db->setError();
        }

    }

    public function insertInstagramSource($feedId, $sourceId, $fanCount, $name){
        $sourceSql = 'INSERT INTO instagram_sources 
        (
            id,
            fan_count,
            `name`
        )
        VALUES
        (
            :id,
            :fanCount,
            :name
        )';

        $stmt = $this->db->prepare($sourceSql);
        $stmt->bindValue(':id', $sourceId);
        $stmt->bindValue(':fanCount', $fanCount);
        $stmt->bindValue(':name', $name);
        
        try {
            $stmt->execute();
        } catch (PDOException $e) {
            echo $e;
            $this->db->setError();
        }

        $mmSql = 'INSERT INTO feeds_instagram_sources 
        (
            feed_id,
            instagram_source_id
        )
        VALUES
        (
            :feedId,
            :sourceId
        )';

        $stmt = $this->db->prepare($mmSql);
        $stmt->bindValue('feedId', $feedId);
        $stmt->bindValue('sourceId', $sourceId);
        try {
            $stmt->execute();
        } catch (PDOException $e) {
            echo $e;
            $this->db->setError();
        }

    }

}