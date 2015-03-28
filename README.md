# blacker hues

A very goth message board.

This is the project we're going to work on today.

I'm not going to talk, but I am going to explain my thought process in words.

Just like this.

Let's look at what we have to work with.

What do we have to do?

## TODO

  * data model [DONE]
  * migrations [DONE]
  * model classes
  * controllers
  * views

That looks like a good start. After we get those done, let's think about:

  * styling (hint: it'll be black)
  * javascript / AJAXey goodness

But that's another video.

## 1. Data model

I want threaded comments. I actually don't like threaded comments that much as a user—I think reddit gets pretty hard to read. But it's an interesting problem, and I'd like to demonstrate how to solve it.

Also, our goth message board shouldn't be too user friendly. That would be weird.

What tables do we have?

  * Posts
  * Comments? maybe?
  * Users

We definitely need Users and Posts. I don't think we need comments if we're doing threading. I think our Posts can just have a parent Post, and a Post whose parent is NULL is a top-level post.

Let's throw down some migrations.