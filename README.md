Seg
===

Segment matcher for paths.

Description
-----------

Seg provides two methods for consuming and capturing path segments.
A path is a string that starts with a slash and contains segments
separated by slashes, for example `/foo/bar/baz` or `/users/42`.

Usage
-----

Consider this program:

```dart
// Instantiate Seg
var s = new Seg("/users/42");

// Check consumed segments
assert(s.prev == "");

// Check current value
assert(s.curr == "/users/42");

// Consume part of the path
assert(s.consume("users") == true);

// Check again consumed segments
assert(s.prev == "/users");

// Check again current value
assert(s.prev == "/42");

// Consume part of the path
assert(s.consume("42") == true);

// Check again consumed segments
assert(s.prev == "/users/42");

// Check again current value
assert(s.prev == "");
```

The previous example shows how to walk the path by
providing segments to consume. In the following
example, we'll see what happens when we try to
consume a segment with a string that doesn't match:

```dart
// Instantiate Seg
var s = new Seg("/users/42");

// Check consumed segments
assert(s.prev == "");

// Check current value
assert(s.curr == "/users/42");

// Try to consume part of the path
assert(s.consume("admin") == false);

// Check again consumed segments
assert(s.prev == "");

// Check again current value
assert(s.curr == "/users/42");
```

As you can see, the command fails and the `prev` and
`curr` strings are not altered. Now we'll see
how to capture segment values:

```dart
// Instantiate Seg
var s = new Seg("/users/42");

// Storage for captures
var captures = new Map<String, String>();

// Check consumed segments
assert(s.prev == "");

// Check current value
assert(s.curr == "/users/42");

// Capture a segment
assert(s.capture("foo", captures) == true);

// Check again consumed segments
assert(s.prev == "/users");

// Check again current value
assert(s.prev == "/42");

// Capture another segment
assert(s.capture("bar", captures) == true);

// Check again consumed segments
assert(s.prev == "/users/42");

// Check again current value
assert(s.prev == "");

// Check captured values
assert(captures["foo"] == "users");
assert(captures["bar"] == "42");
```

Installation
------------

You can install it using `pub`. Check the [package
page](https://pub.dartlang.org/packages/seg) for more info.

