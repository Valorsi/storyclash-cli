<?php

class CopyView {
    public static function showCopy($feed, $sources = [], $posts = []) {
        echo "Feed:\n";
        print_r($feed);
        echo "Sources:\n";
        print_r($sources);
        echo "Posts:\n";
        print_r($posts);
        echo "Copy Completed! Thanks for using Boris Jankovic Software!";
    }

    public static function showError($message) {
        echo "Error: $message\n";
        CopyView::showOptions();
    }

    public static function showOptions() {
        echo "Allowed options are:\n";
        echo "--only or -o (tiktok or instagram)\n";
        echo "--include-posts or -i (number of posts you want to include)\n";
    }
}