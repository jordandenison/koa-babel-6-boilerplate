import route from 'koa-route'

const apiVersion = 'v1'
const baseRoute = '/api/' + apiVersion

const routes = {
  init (app) {
    app.use(route.get('/', function *() { this.body = 'ok' }))
    app.use(route.get('/protected', function *() { this.body = 'protected' }))
  }
}

module.exports = routes
