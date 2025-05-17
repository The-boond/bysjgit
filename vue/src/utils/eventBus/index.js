// EventBus.js

import { createApp, inject } from 'vue'

const EventBusSymbol = Symbol()

const EventBus = {
  install(app) {
    const eventBus = createApp({})
    app.provide(EventBusSymbol, eventBus)
  },

  useEventBus() {
    const eventBus = inject(EventBusSymbol)
    if (!eventBus) {
      throw new Error('Event Bus not found')
    }
    return eventBus
  }
}

export default EventBus