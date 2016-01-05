server = require '../../src/server'
request = supertest server

describe 'Status route', ->

  describe '/', ->

    describe 'GET', ->

      it 'responds 200', (done) ->
        request
        .get '/'
        .expect 200, done
