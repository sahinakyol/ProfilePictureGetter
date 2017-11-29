package src;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class Parser {

            public String twitterPictureURL(String Username) {
                String UrlTwitter = null;
                try {
                    Document document = Jsoup.connect("https://twitter.com/" + Username).get();
                    UrlTwitter = document.getElementsByClass("ProfileAvatar-image").attr("src");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return UrlTwitter;
            }

            public String instagramPictureURL(String Username) {
                String instagramURL = null;
                try {
                    Document document = Jsoup.connect("https://instagram.com/" + Username).get();
                    Elements metaTags = document.getElementsByTag("meta");
                    for (Element metaTag : metaTags) {
                        String content = metaTag.attr("content");
                        String property = metaTag.attr("property");
                        if ("og:image".equals(property)) {
                           instagramURL = content;
                        }
                    }
                    } catch (Exception e) {
                    e.printStackTrace();
                }

                return instagramURL;

            }
}


