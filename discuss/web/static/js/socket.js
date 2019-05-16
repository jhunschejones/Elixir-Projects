import {Socket} from "phoenix"

const createSocket = (topicId) => {
  if (!window.userToken) {
    document.getElementById('comments').classList.add("hide")
    return console.log("Unable to locate user. You have either not signed in, or something went wrong with our network connection.")
  }

  let socket = new Socket("/socket", {params: {token: window.userToken}})
  socket.connect()

  let channel = socket.channel(`comments:${topicId}`, {})
  channel.join()
    .receive("ok", resp => {
      if (resp.comments.length > 0) {
        renderComments(resp.comments);
      } else {
        document.getElementById('comments').classList.add("hide")
      }
    })
    .receive("error", resp => { console.log("Unable to join", resp); })

  channel.on(`comment:${topicId}:new`, payload => {
    renderComment(payload.comment);
  });

  document.getElementById("submit-comment-button").addEventListener("click", function(){
    channel.push("comment:add", { content: document.getElementById("comment-textarea").value });
    document.getElementById("comment-textarea").value = "";
  });
}

function renderComment(comment) {
  document.getElementById('comments').classList.remove("hide")
  document.getElementById('comments').innerHTML += commentToHTML(comment);
}

function renderComments(comments) {
  document.getElementById('comments').classList.remove("hide")
  const renderedComments = comments.map(comment => {
    return commentToHTML(comment);
  });

  document.getElementById('comments').innerHTML = renderedComments.join('');
}

function commentToHTML(comment) {
  return `<li class="collection-item"><div class="light-blue-text">${comment.user.email}</div><div>${comment.content}</div></li>`;
}

// add this function into the window scope
window.createSocket = createSocket;
