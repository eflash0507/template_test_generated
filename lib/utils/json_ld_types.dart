
///Usage : décrire une page générique pour améliorer les informations en SERP (titre, description, image) schema.org.
///Quand : toute page générique de votre site (ex. accueil, à propos).
///Améliore le titre et la description dans la SERP.
final String jsonLdWebPage = '''
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebPage",
  "name": "Accueil - MonApp",
  "description": "Page d’accueil de MonApp, multilingue et SEO-friendly."
}
</script>
            ''';

///Usage : déclarer un moteur de recherche interne ou la structure globale du site schema.org.
///Quand : pour indiquer un moteur de recherche interne ou le site global.
///Permet à Google d’afficher un champ de recherche directement dans les résultats
final String jsonLdWebSite = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"WebSite",
  "url":"https://www.monsite.com/",
  "potentialAction": {
    "@type":"SearchAction",
    "target":"https://www.monsite.com/search?q={search_term}",
    "query-input":"required name=search_term"
  }
}
</script>
            ''';

///Usage : décrire votre entité (entreprise, ONG, marque) developers.google.com.
///Quand : site vitrine ou entreprise sans point de vente physique.
///Alimente les Knowledge Panels et les assistants IA.
final String jsonLdOrganization = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"Organization",
  "name":"MonApp",
  "url":"https://www.monsite.com/",
  "logo":"https://www.monsite.com/logo.png",
  "sameAs":[
    "https://www.youtube.com/ma-chaine",
    "https://www.instagram.com/monprofil",
    "https://www.tiktok.com/@monprofil"
  ]
}
</script>
            ''';

///Usage : si vous avez un emplacement physique, permet d’apparaître dans les résultats locaux (Google Maps, Baidu Maps) developers.google.com.
///Quand : entreprise avec adresse physique (restaurant, magasin) pour le SEO local.
///Apparaît dans les résultats locaux (Google Maps, Baidu Map).
final String jsonLdLocalBusiness = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"LocalBusiness",
  "name":"MonApp Boutique",
  "address": {
    "@type":"PostalAddress",
    "streetAddress":"10 avenue des Champs-Élysées",
    "addressLocality":"Paris",
    "postalCode":"75008",
    "addressCountry":"FR"
  },
  "telephone":"+33-1-23-45-67-89",
  "openingHours":"Mo-Su 09:00-19:00"
}
</script>
            ''';

///Usage : tout contenu éditorial (besoin de Featured Snippets) schema.orgdevelopers.google.com.
///Quand : contenu éditorial standard (guide, analyse).
///Automatiquement eligible for Featured Snippets.
final String jsonLdArticle = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"Article",
  "headline":"Apple announces iPhone SE",
  "description":"New iPhone announced at 11:30 in California.",
  "datePublished":"2024-03-21T11:30:00-07:00",
  "author": { "@type":"Person","name":"Jane Doe" }
}
</script>
            ''';

///Usage : actualités, journaux developers.google.com.
///Quand : actualités, communiqués de presse.
///Améliore la visibilité dans Google News.
final String jsonLdNewsArticle = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"NewsArticle",
  "headline":"Economy grows by 3% in Q1",
  "image":["https://.../economy.jpg"],
  "datePublished":"2024-04-01T08:00:00+00:00",
  "dateModified":"2024-04-02T09:00:00+00:00",
  "author":[{"@type":"Person","name":"John Smith"}]
}
</script>
            ''';

///Usage : billets de blog schema.org.
///Quand : billets de blog.
///Permet d’apparaître dans les “Top Stories”.
final String jsonLdBlogPosting = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"BlogPosting",
  "headline":"5 Tips for Flutter Web",
  "author":{"@type":"Person","name":"Alex Dev"},
  "datePublished":"2024-05-10",
  "image":"https://…/tips.png"
}
</script>
            ''';

///Usage : questions/réponses, très utile pour IA et Featured Snippets developers.google.com.
///Quand : section questions/réponses.
///Génère un rich snippet FAQ dans la SERP.
final String jsonLdFaqPage = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"FAQPage",
  "mainEntity":[
    {"@type":"Question","name":"How to change language?","acceptedAnswer":{"@type":"Answer","text":"Use the dropdown in the header."}},
    {"@type":"Question","name":"What is DEV mode?","acceptedAnswer":{"@type":"Answer","text":"The green banner indicates DEV environment."}}
  ]
}
</script>
            ''';

///Usage : tutoriels pas à pas json-ld.orgschemantra.com.
///Quand : tutoriels pas-à-pas.
///Affiché en carrousel de steps.
final String jsonLdHowTo = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"HowTo",
  "name":"Install MonApp",
  "step":[
    {"@type":"HowToStep","url":"#step1","name":"Download","text":"Download the package."},
    {"@type":"HowToStep","url":"#step2","name":"Install","text":"Run flutter pub get."}
  ]
}
</script>
            ''';

///Usage : e-commerce, pour afficher prix et évaluation developers.google.com.
///Affiche prix et disponibilité dans les résultats de shopping.
final String jsonLdEcommerce = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"Product",
  "name":"Flutter T-Shirt",
  "image":"https://…/tshirt.png",
  "description":"Comfortable Flutter-branded T-Shirt.",
  "offers":{
    "@type":"Offer",
    "price":"19.99",
    "priceCurrency":"USD",
    "availability":"http://schema.org/InStock"
  }
}
</script>
            ''';

///Usage : événements, concerts, conférences schema.org.
///Améliore l’affichage dans Google Events.
final String jsonLdEvent = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"Event",
  "name":"Flutter Conference 2024",
  "startDate":"2024-09-15T09:00",
  "location":{"@type":"Place","name":"Palais des Congrès","address":"Paris"}
}
</script>
            ''';

///Permet d’afficher la vidéo directement dans les résultats.
final String jsonLdVideoObject = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"VideoObject",
  "name":"Flutter Tutorial",
  "description":"Learn Flutter Web.",
  "thumbnailUrl":"https://…/thumb.jpg",
  "uploadDate":"2024-03-01",
  "contentUrl":"https://…/video.mp4"
}
</script>
            ''';

///Affiche le player audio dans les SERP compatibles.
final String jsonLdAudioObject = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"AudioObject",
  "name":"Podcast Flutter",
  "contentUrl":"https://…/podcast.mp3"
}
</script>
            ''';

///Usage : top 10, playlists schema.org.
final String jsonLdItemList = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"ItemList",
  "itemListElement":[
    {"@type":"ListItem","position":1,"item":{"@id":"1","name":"Item A"}},
    {"@type":"ListItem","position":2,"item":{"@id":"2","name":"Item B"}}
  ]
}
</script>
            ''';

///Affiche étoiles et avis.
final String jsonLdAggregateRating  = '''
<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@type":"Product",
  "name":"Gadget",
  "aggregateRating":{
    "@type":"AggregateRating",
    "ratingValue":"4.5",
    "reviewCount":"24"
  },
  "review":[
    {"@type":"Review","author":"Alice","reviewBody":"Très bon produit","reviewRating":{"@type":"Rating","ratingValue":"5"}}
  ]
}
</script>
            ''';

///Quand l’utiliser :
///Pour décrire un individu (auteur d’un article, membre d’une équipe, orateur d’un événement). Utile pour les pages « À propos », profils, biographies.
final String jsonLdPerson = '''
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Course",
  "name": "Masterclass Flutter Web",
  "description": "Apprenez à créer des webapps performantes avec Flutter.",
  "provider": {
    "@type": "Organization",
    "name": "Tech Academy",
    "url": "https://www.techacademy.com"
  },
  "hasCourseInstance": {
    "@type": "CourseInstance",
    "courseMode": "online",
    "instructor": {
      "@type": "Person",
      "name": "Alice Dupont"
    },
    "startDate": "2025-08-01",
    "endDate": "2025-08-31"
  }
}
</script>
            ''';

///Quand l’utiliser :
///Pour afficher une offre d’emploi (sur votre site carrière). Permet aux moteurs de montrer le poste directement dans les résultats de recherche d’emploi.
final String jsonLdJobPosting = '''
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Course",
  "name": "Masterclass Flutter Web",
  "description": "Apprenez à créer des webapps performantes avec Flutter.",
  "provider": {
    "@type": "Organization",
    "name": "Tech Academy",
    "url": "https://www.techacademy.com"
  },
  "hasCourseInstance": {
    "@type": "CourseInstance",
    "courseMode": "online",
    "instructor": {
      "@type": "Person",
      "name": "Alice Dupont"
    },
    "startDate": "2025-08-01",
    "endDate": "2025-08-31"
  }
}
</script>
            ''';

///Quand l’utiliser :
///Pour décrire une formation en ligne ou en présentiel (MOOC, atelier). Aide les étudiants à trouver votre cours via la recherche de cours.
final String jsonLdCourse = '''
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Recipe",
  "name": "Crêpes Bretonnes",
  "image": "https://www.monsite.com/images/crepes.jpg",
  "author": {
    "@type": "Person",
    "name": "Marie Leclerc"
  },
  "datePublished": "2025-05-20",
  "description": "Recette traditionnelle des crêpes bretonnes.",
  "recipeIngredient": [
    "250g de farine",
    "3 œufs",
    "500ml de lait",
    "1 pincée de sel"
  ],
  "recipeInstructions": [
    {
      "@type": "HowToStep",
      "text": "Mélangez la farine et le sel."
    },
    {
      "@type": "HowToStep",
      "text": "Ajoutez les œufs et fouettez."
    },
    {
      "@type": "HowToStep",
      "text": "Versez le lait petit à petit."
    }
  ],
  "cookTime": "PT15M",
  "prepTime": "PT10M",
  "totalTime": "PT25M",
  "recipeYield": "10 crêpes"
}
</script>
            ''';

///Quand l’utiliser :
///Pour partager une recette de cuisine. Permet aux moteurs d’afficher un aperçu enrichi (temps de cuisson, ingrédients).
final String jsonLdRecipe = '''
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Recipe",
  "name": "Crêpes Bretonnes",
  "image": "https://www.monsite.com/images/crepes.jpg",
  "author": {
    "@type": "Person",
    "name": "Marie Leclerc"
  },
  "datePublished": "2025-05-20",
  "description": "Recette traditionnelle des crêpes bretonnes.",
  "recipeIngredient": [
    "250g de farine",
    "3 œufs",
    "500ml de lait",
    "1 pincée de sel"
  ],
  "recipeInstructions": [
    {
      "@type": "HowToStep",
      "text": "Mélangez la farine et le sel."
    },
    {
      "@type": "HowToStep",
      "text": "Ajoutez les œufs et fouettez."
    },
    {
      "@type": "HowToStep",
      "text": "Versez le lait petit à petit."
    }
  ],
  "cookTime": "PT15M",
  "prepTime": "PT10M",
  "totalTime": "PT25M",
  "recipeYield": "10 crêpes"
}
</script>
            ''';

///Quand l’utiliser :
///Pour décrire un service professionnel (consulting, nettoyage, réparation). Améliore le référencement local et la découvrabilité.
final String jsonLdService = '''
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Service",
  "serviceType": "Nettoyage à domicile",
  "provider": {
    "@type": "LocalBusiness",
    "name": "Nettoyage Express",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "45 avenue Propre",
      "addressLocality": "Lyon",
      "postalCode": "69001",
      "addressCountry": "FR"
    },
    "telephone": "+33-4-12-34-56-78"
  },
  "areaServed": {
    "@type": "AdministrativeArea",
    "name": "Région Auvergne-Rhône-Alpes"
  },
  "description": "Service de nettoyage complet de votre domicile."
}
</script>
            ''';

///uand l’utiliser :
///Pour référencer votre application (mobile, web) dans des résultats spécialisés (Google Play, Edge Addons). Indique l’OS, la licence, version.
final String jsonLdSoftwareApplication = '''
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "SoftwareApplication",
  "name": "MonApp Mobile",
  "operatingSystem": "iOS, Android",
  "applicationCategory": "BusinessApplication",
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.7",
    "ratingCount": "234"
  },
  "offers": {
    "@type": "Offer",
    "price": "0.00",
    "priceCurrency": "USD"
  },
  "softwareVersion": "2.3.1",
  "url": "https://play.google.com/store/apps/details?id=com.example.monapp"
}
</script>
            ''';