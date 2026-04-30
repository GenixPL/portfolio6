import 'package:portfolio6/models/_models.dart';

class RustMorsePersonalProject extends PersonalProject {
  RustMorsePersonalProject()
    : super(
        id: 'rust-morse',
        assetImagePath: 'assets/images/projects/rust-morse/rust-morse-banner.png',
        name: 'Morse encoder-decoder CLI app in Rust',
        tags: ['Rust', 'TUI', 'morse code', 'audio'],
        dateText: '5 - 27 Mar 2026',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(
        path: assetImagePath!,
      ),
      Headline(
        text: name,
        center: true,
      ),

      Space.big(),
      GithubLink(
        url: 'https://github.com/GenixPL/rust_morse',
      ),
      Space.medium(),
      Tags(
        tags: tags,
      ),

      Space.medium(),
      Title(text: 'Why Rust'),
      Space.small(),
      Body(
        text:
            'After hearing so many good words about Rust, specifically its safety, '
            'I wanted to get to know it a bit, which combined nicely with my willingness to '
            'do something in a lower level language.',
      ),
      Space.small(),
      Body(
        text:
            'Imo learning completely different '
            'programming languages, in this case my normally highly abstract ones vs low level, '
            'exposes us to new concepts that can be moved between and improve the "non-native" '
            'to them code, e.g. huge codebases, that are typically written in high '
            'object-oriented languages, can benefit massively when exposed to some functional '
            'programming paradigms.',
      ),

      Space.medium(),
      Title(text: 'Why morse code'),
      Space.small(),
      Body(
        text:
            'I once heard about this hacking project that took control over power-indicating '
            'diodes of two devices to communicate between them in morse code and send some data, '
            'so I wanted to recreate the initial software step of it and program a morse '
            'encoder-decoder in Rust as the learning project.',
      ),
      Space.small(),
      Body(
        text:
            'Boi had I no idea what I was up to. I thought the project would take me a week, '
            'instead I spent 3 weeks, of constant chatting with Gemini, and ended up with something '
            'just resembling a success.',
      ),
      Space.small(),

      Space.medium(),
      Title(text: 'The problems'),
      Space.small(),
      Body(
        text:
            "I think reading Rust code is not the easiest thing on Earth. The closures aren't the "
            'most intuitive, the macros with their exclamation marks, all the Option handling, '
            'type declarations, and all these extras related to memory management...',
      ),
      Space.small(),
      Body(
        text:
            'All these things make, imo, the language excellent for actual "meaningful" work, but '
            "when it comes to pet projects, it's just so much more pleasant and faster to use "
            "something higher and with garbage collector.",
      ),

      Space.medium(),
      Body(
        text:
            'Documentation is another thing that requires time to get used to, probably due to me '
            'being low-level novice and the previous point. Fortunately I could chat with Gemini for (free) '
            'hours without end, because otherwise I think I would have given up. The compiler '
            "might be giving us most of the answers, but they aren't that helpful when one doesn't "
            "understand half the things.",
      ),

      Space.medium(),
      Body(
        text:
            'Lack of community support - 3rd party packages, is another problem. When it comes '
            'handling of in- and out- audio in the project, I started with using the most supported cpal '
            'library. That overwhelmed me completely with its almost complete lack of abstractions. Then, '
            "I was searching for some higher-level stuff, and was finding only stuff that hadn't been "
            "supported for months, and I finally had to settle on a package with custom reference "
            "pointing to a specific commit that fixed some dependency resolution problems.",
      ),

      Space.medium(),
      Body(
        text:
            "And apparently we didn't have good general purpose morse audio decoders until "
            "the latest arrival of LLMs. Due to lack of commercial usage no one has spent time "
            "and money on developing perfect solutions. Existing solutions, when given unsanitized "
            '"open-world" samples, have problems with differentiating the noise from signal, since '
            'the morse standards allows any sound to be a carrier, any frequency, from clapping '
            'to high pitch unhearable waves. And they also struggle with the fact that the standard '
            'is very liberal when it comes to its frequencies - a dot could last for a second, or it could '
            "last for ten. It's all easy for our advances, pattern-searching, brains to extract and analyze, "
            "extremely difficult for an old-fashion (non LLM) algorithm.",
      ),
      Space.small(),
      Body(
        text:
            "In the end I just settled on decoding pure (without any background noise) sounds "
            "with fixed known frequencies. I just wanted to be done with the project.",
      ),

      Space.medium(),
      Title(text: 'Conclusions'),
      Space.small(),
      Body(
        text:
            'I would choose Rust for commercial work, over C and C++, 100% of the time. '
            'The safety provided by the language is worth all its negatives. But when it comes '
            "to personal projects, I would pick it only if part of the project's aim was to use "
            "Rust for the sake of it, otherwise it's not worth it imo. The amount of code, lack of "
            'community support, and the overall "niceness" of it is not worth it, and I would '
            'much better '
            'prefer implementing the same thing in some more-established higher-level thing '
            'in half the time.',
      ),
      Space.small(),
      Body(
        text:
            "That being said, I highly recommend using it just for the sake of using it. It helps "
            "getting deeper low-level knowledge, and provides a nice challenge.",
      ),

      Space.medium(),
      YouTube(
        embedUrl: 'https://www.youtube.com/embed/zG_l62RIHM4',
      ),

      Space.big(),
      Body(
        text: "And decoding a morse code might not be the best language-learning project.",
      ),
    ];
  }
}
