// Copyright (c) 2015 Michel Martens
// See the MIT license details in the LICENSE file.

library seg;

class Seg {
  String path;
  int pos = 1;

  Seg(this.path);

  String get head => path[pos];
  String get curr => path.substring(pos - 1, size);
  String get prev => path.substring(0, pos - 1);
  bool   get root => pos >= size;
  int    get size => path.length;

  void _move(offset) {
    pos += offset + 1;
  }

  String _find(index) {
    var offset = pos + index;

    if (offset >= size) {
      return null;
    } else {
      return path[offset];
    }
  }

  String _subs(len) {
    var offset = pos + len;

    if (offset > size) {
      return null;
    } else {
      return path.substring(pos, offset);
    }
  }

  bool consume(String str) {
    if (root) {
      return false;
    }

    var len = str.length;
    var found = _find(len);

    if (found == null || found == '/') {
      if (_subs(len) == str) {
        _move(len);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool capture(String key, Map store) {
    if (root) {
      return false;
    }

    var index = path.substring(pos, size).indexOf('/');

    if (index == -1) {
      index = size;
    } else {
      index += pos;
    }

    store[key] = path.substring(pos, index);
    _move(index - pos);

    return true;
  }
}
