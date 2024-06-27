<?php
use PHPUnit\Framework\TestCase;

use function PHPUnit\Framework\assertTrue;

require_once __DIR__ . '/../models/Database.php';
require_once __DIR__ . '/../models/Post.php';

class PostsTest extends TestCase {

    public function testCanBeSelected() {
        
        $feedId = 1;
        $testPosts = [
            [
            'id' => 1,
            'feed_id' => $feedId,
            'url' => 'http://example.com/post21'
            ]
        ];

        $db = new Database();
        $post = new Post($db);
        $postData = $post->getPostsByFeedId($feedId, 5);

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