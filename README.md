# Spotify Lyrics (Fabric 1.21.11, Java 21)

## Build
    gradle wrapper --gradle-version 9.2.1   # once, if no wrapper is present (needs JDK 21+)
    ./gradlew build                         # jar in build/libs/
Or open the folder in IntelliJ IDEA (JDK 21) and run the `runClient` Gradle task.

## Setup in game
1. https://developer.spotify.com/dashboard -> Create app (Web API). Add redirect URI exactly:
   http://127.0.0.1:8888/callback
2. Mod Menu -> Spotify Lyrics -> Spotify tab -> paste the Client ID.
3. In chat run /lyrics login (browser opens, approve). Play a song on Spotify.

Commands: /lyrics login | logout | toggle | recenter
Apps in Spotify "development mode" only work for accounts added under User Management.

## Versions (verified against published coordinates)
Minecraft 1.21.11, Yarn 1.21.11+build.4, Loader 0.18.4, Loom 1.14-SNAPSHOT,
Fabric API 0.141.1+1.21.11, Cloth Config 21.11.153, Mod Menu 17.0.0, Gradle 9.2.1.

## Build a downloadable jar with GitHub Actions
1. Create a GitHub repo and push this project (see below).
2. Every push to `main` builds the mod; get the jar from Actions -> latest run -> Artifacts.
3. To publish a Release (jar on the Releases tab), push a version tag:

       git tag v1.1.0
       git push origin v1.1.0

   The tag number becomes the jar's version (spotify-lyrics-1.1.0.jar).

    git init && git add . && git commit -m "Initial commit"
    git branch -M main
    git remote add origin https://github.com/YOUR_NAME/spotify-lyrics-mod.git
    git push -u origin main
