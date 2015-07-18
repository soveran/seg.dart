import "package:seg/seg.dart";

main() {

  // Consume
  var seg = new Seg("/foo/bar/baz");

  assert(seg.consume("bar") == false);
  assert(seg.prev == "");
  assert(seg.curr == "/foo/bar/baz");

  assert(seg.consume("foo") == true);
  assert(seg.prev == "/foo");
  assert(seg.curr == "/bar/baz");

  assert(seg.consume("foo") == false);
  assert(seg.prev == "/foo");
  assert(seg.curr == "/bar/baz");

  assert(seg.consume("bar") == true);
  assert(seg.prev == "/foo/bar");
  assert(seg.curr == "/baz");

  assert(seg.consume("baz") == true);
  assert(seg.prev == "/foo/bar/baz");
  assert(seg.curr == "");

  assert(seg.consume("baz") == false);
  assert(seg.prev == "/foo/bar/baz");
  assert(seg.curr == "");

  // Capture
  seg = new Seg("/foo/bar/baz");
  var captures = new Map<String, String>();

  assert(seg.capture("c1", captures) == true);
  assert(seg.prev == "/foo");
  assert(seg.curr == "/bar/baz");

  assert(seg.capture("c2", captures) == true);
  assert(seg.prev == "/foo/bar");
  assert(seg.curr == "/baz");

  assert(seg.capture("c3", captures) == true);
  assert(seg.prev == "/foo/bar/baz");
  assert(seg.curr == "");

  assert(seg.capture("c4", captures) == false);
  assert(seg.prev == "/foo/bar/baz");
  assert(seg.curr == "");

  assert(captures["c1"] == "foo");
  assert(captures["c2"] == "bar");
  assert(captures["c3"] == "baz");
  assert(captures["c4"] == null);
}
