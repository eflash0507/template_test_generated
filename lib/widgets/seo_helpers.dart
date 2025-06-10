import 'package:flutter/widgets.dart';
import 'package:seo/seo.dart';

/// SeoHead : injecte vos <meta> et <link> dans le <head>, puis affiche `child`.
class SeoHead extends StatelessWidget {
  final List<HeadTag> tags;  // MetaTag, LinkTag…
  final Widget child;
  const SeoHead({required this.tags, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Seo.head(
      tags: tags,
      child: child,
    );
  }
}

/// SeoText : génère une balise <p> ou <h1>, puis affiche `child`.
class SeoText extends StatelessWidget {
  final String text;
  final TextTagStyle style;
  final Widget child;
  const SeoText({
    required this.text,
    this.style = TextTagStyle.p,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Seo.text(
      text: text,
      style: style,
      child: child,
    );
  }
}

/// SeoLink : génère une balise <a>, puis affiche `child`.
class SeoLink extends StatelessWidget {
  final String href;
  final String anchor;
  final String? rel;
  final Widget child;
  const SeoLink({
    required this.href,
    required this.anchor,
    this.rel,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Seo.link(
      href: href,
      anchor: anchor,
      rel: rel,
      child: child,
    );
  }
}

/// SeoImage : génère une balise <img>, puis affiche `child`.
class SeoImage extends StatelessWidget {
  final String src;
  final String alt;
  final Widget child;
  const SeoImage({
    required this.src,
    required this.alt,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Seo.image(
      src: src,
      alt: alt,
      child: child,
    );
  }
}

/// SeoHtml : injecte du HTML brut, puis affiche `child`.
class SeoHtml extends StatelessWidget {
  final String html;
  final Widget child;
  const SeoHtml({
    required this.html,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Seo.html(
      html: html,
      child: child,
    );
  }
}
