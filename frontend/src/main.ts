import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store, { RECEIVE_EVENTS } from './store'
import vuetify from './plugins/vuetify'
import VueNativeSock from 'vue-native-websocket'
import VueApexCharts from 'vue-apexcharts'

Vue.use(VueApexCharts)

Vue.component('apexchart', VueApexCharts)

const ws = process.env.NODE_ENV === 'production' ? `ws://${window.location.host}/ws` : process.env.VUE_APP_WS

Vue.use(VueNativeSock, ws, {
  format: 'json',
  reconnection: true,
  store,
  passToStoreHandler: function (eventName: string, event: any) {
    if (eventName.includes('onmessage')) {
      this.store.dispatch(RECEIVE_EVENTS, JSON.parse(event.data))
    }
  }
})

Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')