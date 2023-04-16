class Recommendation {
  String name;
  String imgUrl;
  String linkUri;

  Recommendation({
    required this.name,
    required this.imgUrl,
    required this.linkUri,
  });
}

var recommendationsList = [
  Recommendation(
    name: 'YouTube',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/YouTube_Logo_%282013-2017%29.svg/2560px-YouTube_Logo_%282013-2017%29.svg.png',
    linkUri: 'https://www.youtube.com/',
  ),
  Recommendation(
    name: 'Google',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/2560px-Google_2015_logo.svg.png',
    linkUri: 'https://www.google.com/',
  ),
  Recommendation(
    name: 'Facebook',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Facebook_icon.svg/2560px-Facebook_icon.svg.png',
    linkUri: 'https://www.facebook.com/',
  ),
  Recommendation(
    name: 'Instagram',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2560px-Instagram_icon.png',
    linkUri: 'https://www.instagram.com/',
  ),
  Recommendation(
    name: 'Twitter',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Logo_of_Twitter%2C_Inc..svg/2491px-Logo_of_Twitter%2C_Inc..svg.png',
    linkUri: 'https://twitter.com/',
  ),
  Recommendation(
    name: 'Reddit',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Reddit_logo.svg/2560px-Reddit_logo.svg.png',
    linkUri: 'https://www.reddit.com/',
  ),
  Recommendation(
    name: 'TikTok',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/id/thumb/a/a9/TikTok_logo.svg/2560px-TikTok_logo.svg.png',
    linkUri: 'https://www.tiktok.com/',
  ),
  Recommendation(
    name: 'Twitch',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Twitch_logo.svg/2560px-Twitch_logo.svg.png',
    linkUri: 'https://www.twitch.tv/',
  ),
  Recommendation(
    name: 'Discord',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Discord_Color_Text_Logo_No_Padding.svg/2560px-Discord_Color_Text_Logo_No_Padding.svg.png',
    linkUri: 'https://discord.com/',
  ),
  Recommendation(
    name: 'Spotify',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Spotify_logo_without_text.svg/2560px-Spotify_logo_without_text.svg.png',
    linkUri: 'https://www.spotify.com/',
  ),
  Recommendation(
    name: 'Netflix',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Netflix_2015_logo.svg/2560px-Netflix_2015_logo.svg.png',
    linkUri: 'https://www.netflix.com/',
  ),
  Recommendation(
    name: 'Amazon',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/2560px-Amazon_logo.svg.png',
    linkUri: 'https://www.amazon.com/',
  ),
  Recommendation(
    name: 'Stack Overflow',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Stack_Overflow_icon.svg/2560px-Stack_Overflow_icon.svg.png',
    linkUri: 'https://stackoverflow.com/',
  ),
  Recommendation(
    name: 'GitHub',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Octicons-mark-github.svg/2560px-Octicons-mark-github.svg.png',
    linkUri: 'https://github.com',
  ),
  Recommendation(
    name: 'Google Drive',
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Google_Drive_icon_%282020%29.svg/2560px-Google_Drive_icon_%282020%29.svg.png',
    linkUri: 'https://drive.google.com/',
  ),
];

var listFavorites = [];
