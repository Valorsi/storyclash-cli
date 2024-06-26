<?php

require_once __DIR__ . '/../models/Feed.php';
require_once __DIR__ . '/../models/Posts.php';
require_once __DIR__ . '/../models/Source.php';
require_once __DIR__ . '/../models/Database.php';
require_once __DIR__ . '/../views/CopyView.php';

class CopyController {
    public $db;
    public $devDb;

    public function __construct()
    {
        $this->db = new Database();
        $this->devDb = new Database('storyclash_dev');
    }

    public function copy($args) {

        $feedId = array_pop($args);

        if (!is_numeric($feedId)) {
            CopyView::showError("Invalid feed ID.");
            return;
        }

        $options = getopt("o::i::", ["only::", "include-posts::"]);
        $only = $options['o'] ?? $options['only'] ?? '';
        $includePosts = $options['i'] ?? $options['include-posts'] ?? '';


        $this->devDb->beginTransaction();

        $feedData = $this->copyFeed($feedId);
        $sourceData = $this->copySources($feedId, $only);
        $postData = $this->copyPosts($feedId, $includePosts);

        if (!$this->devDb->isError)
        {
            $this->devDb->commit();
        }
        else
        {
            $this->devDb->rollback();
        }

        CopyView::showCopy($feedData, $sourceData, $postData);
    }

    public function copyFeed($feedId)
    {
        $feed = new Feed($this->db);
        $feedData = $feed->getFeed($feedId);
        if (!$feedData) {
            CopyView::showError('No Feeds found with this FeedId');
            return;
        }

        $devFeed = new Feed($this->devDb);
        $devFeed->insertFeed($feedData['id'], $feedData['name']);

        return $feedData;
    }

    public function copySources($feedId, $only = '')
    {
        $source = new Source($this->db);
        switch (strtolower($only))
        {
            case 'tiktok': 
                $sources['tiktok'] = $source->getTiktokSources($feedId);
                break;
            case 'instagram': 
                $sources['instagram'] = $source->getInstagramSources($feedId);
                break;
            case '':
            default:
                $sources['tiktok'] = $source->getTiktokSources($feedId);
                $sources['instagram'] = $source->getInstagramSources($feedId);
                break;
        }

        $devSource = new Source($this->devDb);

        if (!empty($sources['tiktok'])) {
            foreach ($sources['tiktok'] as $tt) {
                $devSource->insertTiktokSource($feedId, $tt['tiktok_source_id'], $tt['fan_count'], $tt['name']);
            }
        }

        if (!empty($sources['instagram'])) {
            foreach ($sources['instagram'] as $in) {
                $devSource->insertInstagramSource($feedId, $in['instagram_source_id'], $in['fan_count'], $in['name']);
            }
        }

        return $sources;
    }

    public function copyPosts($feedId, $limit)
    {
        $post = new Post($this->db);
        $posts = $limit !== '' ? $post->getPostsByFeedId($feedId, $limit) : [];
        
        $devPost = new Post($this->devDb);
        if (!empty($posts)) {
            foreach ($posts as $p) {
                $devPost->insertPost($p['id'], $p['feed_id'], $p['url']);
            }
        }

        return $posts;
    }
}