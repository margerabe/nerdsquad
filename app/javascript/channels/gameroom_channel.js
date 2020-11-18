import consumer from "./consumer";

const initGameroomCable = () => {
    const messagesContainer = document.getElementById('messages');
    if (messagesContainer) {
      const id = messagesContainer.dataset.gameroomId;
  
      consumer.subscriptions.create({ channel: "GameroomChannel", id: id }, {
        received(data) {
            messagesContainer.insertAdjacentHTML('beforeend', data);
        },
      });
    }
    // if (movableContainer)
  }

export { initGameroomCable };