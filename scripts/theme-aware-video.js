//
//  theme-aware-video.js
//  TomoCodes
//
//  Created by Tomasz Lizer on 11/05/2025.
//

function reloadThemeAwareVideos() {
    console.log('Reloading theme-aware videos');
    document.querySelectorAll('video.theme-aware-video').forEach((oldVideo) => {
        // Force reload video to apply theme changes
        const newVideo = oldVideo.cloneNode(true);
        oldVideo.parentNode.replaceChild(newVideo, oldVideo);
        
        // Restore playback time if possible
        const currentTime = oldVideo.currentTime;
        newVideo.addEventListener('loadedmetadata', () => {
            if (currentTime < newVideo.duration) {
                newVideo.currentTime = currentTime;
            }
        });
    });
}

// Handle system theme change (for auto mode)
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', reloadThemeAwareVideos);