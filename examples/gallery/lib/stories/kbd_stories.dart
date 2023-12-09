import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;
import 'package:tabler_icon_library/tabler_icon_library.dart';

part 'kbd_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Kbd',
  argTypes: [
    storybook.ArgType<IconData>(
      'icon',
      defaultValue: TablerIcons.sun,
    ),
  ],
)
class KbdMeta extends Meta with _$KbdMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return Kbd('Shift');
  }
}

@storybook.Story('Default')
class KbdDefaultStory extends StoryObj<KbdMeta> with _$KbdDefaultStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Center(
        child: Kbd('Shift'),
      ),
    );
  }
}

@storybook.Story(
  'With Size',
  args: [
    storybook.Arg<String>('size'),
  ],
)
class KbdWithSizeStory extends StoryObj<KbdMeta> with _$KbdWithSizeStory {}

@storybook.Story(
  'With Color',
)
class KbdWithColorStory extends StoryObj<KbdMeta> with _$KbdWithColorStory {}
