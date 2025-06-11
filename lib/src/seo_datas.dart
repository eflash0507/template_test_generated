import 'package:seo/seo.dart';
import 'package:template_test_generated/src/variables.dart';

import 'config.dart';

List<HeadTag> seoHead = [
  // Métadatas HTML de base
  MetaTag(name: 'charset',  content: 'UTF-8'),
  MetaTag(name: 'viewport', content: 'width=device-width, initial-scale=1'),
  MetaTag(name: 'robots',   content: 'index, follow'),

  // Titre et description
  MetaTag(name: 'title',       content: appTitleForCtrSERP),
  MetaTag(name: 'description', content: metaDescription),

  // Canonical & hreflang
  LinkTag(rel: 'canonical', href: Config.mainPageLinkTagCanonical),
  LinkTag(rel: 'alternate', hreflang: 'en', href: Config.mainPageLinkTagAlternateFR),
  LinkTag(rel: 'alternate', hreflang: 'fr', href: Config.mainPageLinkTagAlternateEN),
  LinkTag(rel: 'alternate', hreflang: 'x-default', href: Config.mainPageLinkTagAlternateDefault),

  // iOS meta tags
  MetaTag(name: 'mobile-web-app-capable',       content: "yes"),
  MetaTag(name: 'apple-mobile-web-app-status-bar-style',       content: "black"),
  MetaTag(name: 'apple-mobile-web-app-title',       content: appTitleForCtrSERP),
  /**
      // 4. Open Graph NOT WORKING NEED SERVERLESS
      MetaTag(name: 'og:type',        content: 'website'),
      MetaTag(name: 'og:title',       content: appTitleForCtrSERP),
      MetaTag(name: 'og:description', content: metaDescription),
      MetaTag(name: 'og:url',         content: ogUrl),
      MetaTag(name: 'og:image',       content: ogImg),

      // 5. Twitter Cards NOT WORKING NEED SERVERLESS
      MetaTag(name: 'twitter:card',        content: 'summary_large_image'),
      MetaTag(name: 'twitter:title',       content: titre),
      MetaTag(name: 'twitter:description', content: description),
      MetaTag(name: 'twitter:image',       content: imageUrl),
   **/
];

final String jsonLdOrganization = '''
            <title>$appTitleForCtrSERP</title>
            <script type="application/ld+json">
            {
              "@context":"https://schema.org",
              "@type":"Organization",
              "url":"${Config.mainPageLinkTagAlternateDefault}",
              "name":"$appTitleForCtrSERP",
              "telephone":"+33-1-23-45-67-89",
              "address":{
                "@type":"PostalAddress",
                "streetAddress":"10 avenue des Champs-Élysées",
                "addressLocality":"Paris",
                "postalCode":"75008",
                "addressCountry":"FR"
              },
              "sameAs":[
                "${Config.youtubeLink}",
                "${Config.instagramLink}",
                "${Config.tiktokLink}"
              ]
            }
            </script>
            ''';