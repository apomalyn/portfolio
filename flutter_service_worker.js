'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon.ico": "85bb110ff5d8cbee2de5c21726f07f4c",
"icons/apple-touch-icon.png": "5521a61dbf52d493a7666e0d4dcc650c",
"icons/favicon-16x16.png": "729fe19d0e2f43c20f142c1db38cdaad",
"icons/icon-192x192.png": "614eb6e81ffac4741e2fd885000ed604",
"icons/favicon-32x32.png": "ce429601060cf7c915c5836db1c779bb",
"icons/icon-512x512.png": "b3e0725119385f8c137393088f8eed08",
"index.html": "2dedebed96687560535beeeccdeceeed",
"/": "2dedebed96687560535beeeccdeceeed",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"manifest.json": "a13f141c9d6cd9aec9348eb44cb0836a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/fonts/Montserrat/Montserrat-Regular.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/fonts/Montserrat/Montserrat-Medium.ttf": "c8b6e083af3f94009801989c3739425e",
"assets/fonts/Montserrat/Montserrat-MediumItalic.ttf": "40a74702035bf9ef19053c84ce9a58b9",
"assets/fonts/Montserrat/Montserrat-Bold.ttf": "ade91f473255991f410f61857696434b",
"assets/fonts/Montserrat/Montserrat-BoldItalic.ttf": "1b38414956c666bd1df78fe5b9c84756",
"assets/fonts/MaterialIcons-Regular.otf": "2269efc98438769d5235b91f9f9d3540",
"assets/fonts/JetBrainsMono/JetBrainsMono-Medium-Italic.ttf": "032a3296ce3e14b00a6a32e23b3ce700",
"assets/fonts/JetBrainsMono/JetBrainsMono-ExtraBold-Italic.ttf": "24c4cd85ec1a8e562d684c61d858f1cb",
"assets/fonts/JetBrainsMono/JetBrainsMono-Regular.ttf": "cf92616a4d6d94e520194e43fc7d620f",
"assets/fonts/JetBrainsMono/JetBrainsMono-Bold-Italic.ttf": "ff64793bb0f821986b1c5ac5cd1d2607",
"assets/fonts/JetBrainsMono/JetBrainsMono-Bold.ttf": "35c34a703c52f47af348f9876872daa2",
"assets/fonts/JetBrainsMono/JetBrainsMono-Medium.ttf": "2de6117e521859a9a0947085cd7fc422",
"assets/fonts/JetBrainsMono/JetBrainsMono-Italic.ttf": "7d9da1f97fc6201deb27133615288695",
"assets/fonts/JetBrainsMono/JetBrainsMono-ExtraBold.ttf": "563aee11b8915ff522c9e70eb6def4fe",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "0a326b8a62666dfb5f913741be7a2996",
"assets/assets/images/banner.png": "166d6b321937003b6edad0e15371e552",
"assets/assets/images/picture_account.jpg": "661a397f0a3e086b6f6dbccf403d15d6",
"assets/assets/logos/twitter_logo.png": "fcbcdfb365c90fe38802819a8b56b6f0",
"assets/assets/logos/fox.png": "614eb6e81ffac4741e2fd885000ed604",
"assets/assets/logos/tragile_logo.png": "37ef7b6ac7f0a79e78c0d5b7a48efd9e",
"assets/assets/logos/cinet_logo.png": "967708cae3404bb01acf4d703c08ffe0",
"assets/assets/logos/linkedin_logo.png": "d31912777bd5aec20828fc1ad31d3d51",
"assets/assets/logos/3.0x/herbarium_logo.png": "65c5e3f0b61c08d1e8f04ecf55b3c5a5",
"assets/assets/logos/2.0x/twitter_logo.png": "4807f144f37cb109aa3ebac34267bf0c",
"assets/assets/logos/2.0x/linkedin_logo.png": "289268ccd12c7a599994835bff11147e",
"assets/assets/logos/2.0x/github_mark.png": "ef7a02b69836dc8b6a732a54c4200dcb",
"assets/assets/logos/2.0x/github_white_mark.png": "472739dfb5857b1f659f4c4c6b4568d0",
"assets/assets/logos/2.0x/herbarium_logo.png": "741d199824a3bb4bab791b5844633796",
"assets/assets/logos/github_mark.png": "f87561b8bb354ef83b09a66e54f70e08",
"assets/assets/logos/applets_logo.png": "834b7e72c9a26b79de4e9dd8e1ef7616",
"assets/assets/logos/dsc.png": "44ba62f59219aaa99ce0de1f3466fae1",
"assets/assets/logos/ets_white_logo.png": "d8f260816275171056f980e75cb628e5",
"assets/assets/logos/1.5x/twitter_logo.png": "1af940203151c0494b3b15e7a5f0f525",
"assets/assets/logos/1.5x/linkedin_logo.png": "532009ea5888e1637225d2ea82f8b7f8",
"assets/assets/logos/1.5x/github_mark.png": "438c17272c5f0e9f4a6da34d3e4bc5bd",
"assets/assets/logos/1.5x/github_white_mark.png": "eb94bb97c3410733ce017b184d314723",
"assets/assets/logos/github_white_mark.png": "d56df49a807a9fd06eb1667a84d3810e",
"assets/assets/logos/herbarium_logo.png": "7f4c0125e6ddf6c433751330caa035d0",
"assets/AssetManifest.json": "980d95b2df7cd81a8483264634569f49",
"assets/NOTICES": "d346e8dbbb11234f1256d803ebed424b",
"assets/FontManifest.json": "35c983bbae93066d27bf5cbb4faec5a4",
"version.json": "009c9e65172e010890f7f65fde438006",
"main.dart.js": "97306db96bc03b6ba6d968d04b1dbde9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
