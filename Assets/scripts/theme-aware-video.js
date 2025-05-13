//
//  theme-aware-video.js
//  TomoCodes
//
//  Created by Tomasz Lizer on 11/05/2025.
//

// MARK: Reload video on theme change

function reloadThemeAwareVideos() {
    console.log('Reloading theme-aware videos');
    document.querySelectorAll('video.theme-aware-video').forEach((oldVideo) => {
        // Force reload video to apply theme changes
        const newVideo = oldVideo.cloneNode(true);
        oldVideo.parentNode.replaceChild(newVideo, oldVideo);
        
        // Restore playback time if possible
        const currentTime = oldVideo.currentTime;
        newVideo.onloadedmetadata = () => {
            if (currentTime < newVideo.duration) {
                newVideo.currentTime = currentTime;
            }
        }
    });
}

window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', reloadThemeAwareVideos);

// MARK: Add fallback source based on current theme
// Workaround for issue with media query sometimes not matching correctly on load
document.querySelectorAll('video.theme-aware-video').forEach((video) => {
    const sources = Array.from(video.querySelectorAll("source"));
    const matched = sources.find(source => {
        const media = source.getAttribute("media");
        return media && window.matchMedia(media).matches;
    });
    if (matched) {
        const fallbackSource = matched.cloneNode(true);
        fallbackSource.removeAttribute('media');
        video.appendChild(fallbackSource);
        video.load();
    }
});
