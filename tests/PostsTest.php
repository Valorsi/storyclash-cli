<?php
use PHPUnit\Framework\TestCase;

use function PHPUnit\Framework\assertTrue;

require_once __DIR__ . '/../models/Database.php';
require_once __DIR__ . '/../models/Posts.php';

class PostsTest extends TestCase {

    public function testCanBeSelected() {
        
        $feedId = 1;
        $testPosts = [
            [
                'id' => 1,
                'feed_id' => $feedId,
                'url' => 'http://example.com/post21'
            ],
            [
                'id' => 2,
                'feed_id' => $feedId,
                'url' => 'http://example.com/post22'
            ],
            [
                'id' => 3,
                'feed_id' => $feedId,
                'url' => 'http://example.com/post23'
            ],
            [
                'id' => 4,
                'feed_id' => $feedId,
                'url' => 'http://example.com/post24'
            ],
            [
                'id' => 5,
                'feed_id' => $feedId,
                'url' => 'http://example.com/post25'
            ],
            [
                'id' => 6,
                'feed_id' => $feedId,
                'url' => 'http://example.com/post26'
            ],
            [
                'id' => 7,
                'feed_id' => $feedId,
                'url' => 'http://example.com/post27'
            ],
            [
                'id' => 8,
                'feed_id' => $feedId,
                'url' => 'http://example.com/post28'
            ],
            [
                'id' => 9,
                'feed_id' => $feedId,
                'url' => 'http://example.com/post29'
            ],
            [
                'id' => 10,
                'feed_id' => $feedId,
                'url' => 'http://example.com/post30'
            ]
        ];

        $db = new Database();
        $post = new Post($db);
        $postData = $post->getPostsByFeedId($feedId, 10);

        $this->assertIsArray($postData);
        $this->assertSame($testPosts, $postData);
    }

    public function testCanBeInserted() {
        $feedId = 1;
        $db = new Database();
        $post = new Post($db);
        $post->insertPost('', $feedId, 'https://example.com/testpost');

        $this->assertTrue(!$db->isError);
    }
}