#HTML5 online
This provide two robust offline capabilities. 
## Rack offline
The easiest way to use Rack::Offline is by using Rails::Offline in a Rails application.
In your router write: 
match "/application.manifest"=> Rails::Offline

##Application cache
HTML5 addresses some of the annoyances of being offline with the ApplicationCache interface. 
Application Cache is generally a API 
Vist this link carefully this is crowdy one. https://html.spec.whatwg.org/#applicationcache.
The App cache allows you to specify that the browser should cache certain files, and ensure that the user can access them if the device is offline 
You specify an application’s cache with a new manifest attribute on the html element, which must point at a location on the web that serves the manifest. A manifest looks something like this:

```CACHE MANIFEST

javascripts/application.js
javascripts/jquery.js
images/masthead.png

NETWORK:
/
```

this specifies that the browser should cache the three files immediately following CACHE MANIFEST, and require a network connection for all other URL's 

Note:- It will not flush the cache unless the user specifically asks browser to clear the cache or for security reason 

Also you can use the Updateready event to display a notice to the user that the version of the HTML they are using is out of date.

for more details go to https://github.com/wycats/rack-offline

briefly m ds ta :) kuch naa samaj aaye tan push leyo.



##Javascript local storage
Browser that support app cache can also support Local storage 
This is a javascript api to store extremly simple key-value store

Browser can offer different type of storage using this api 

In combination with App cache you can use Local storage to store data on the device making it possible to show stale data to your users even if no connnection is available. 

For example basic stratergy 
```jQuery(function($) {
  // Declare a function that can take a JS object and
  // populate our HTML. Because we used the App Cache
  // the HTML will be present regardless of online status
  var updateArticles = function(object) {
    template = $("#articles")
    localStorage.articles = JSON.stringify(object);
    $("#article-list").html(template.render(object));
  }

  // Create a flag so we don't poll the server twice
  // at once
 var updating = false;

  // Create a function that will ask the server for
  // updates to the article list
 var remoteUpdate = function() {
    // Don't ping the server again if we're in the
    // process of updating
    if(updating) return;

    updating = true;

    $("#loading").show();
    $.getJSON("/article_list.json", function(json) {
      updateArticles(json);
      $("#loading").hide();
      updating = false;
    });
  }

  // If we have "articles" in the localStorage object,
  // update the HTML with the stale articles. Even if
  // the user never gets online, they will at least
  // see the stale content
  if(localStorage.articles) updateArticles(JSON.parse(localStorage.articles));

  // If the user was offline, and goes online, ask
  // the server for updates
  $(window).bind("online", remoteUpdate);

  // If the user is online, ask for updates now
  if(window.navigator.onLine) remoteUpdate();
})
```
Important links 

* railscasts.com/episodes/247-offline-apps-part-1
* http://www.rubydoc.info/gems/rack-offline/0.6.4
* www.html5rocks.com/en/tutorials/appcache/beginner/



##Summary
Jithey tk mainu lagda sanu aah sab use kerna pau.  

1. Rails Offline/HTML5 cache. 
2. Application Cache interface(API). 
3. Local storage Javascript library

eh 3na nu collabratively use kerna paina 
bai aah wala link padhna na bhulin http://alistapart.com/article/application-cache-is-a-douchebag boht important link hain
aah wala link ch bai ney ehna 3na nu use kr key in offline app banayi hain and aapna experience share kitta 


