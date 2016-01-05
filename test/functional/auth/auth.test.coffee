server = require '../../../src/server'
testData = require '../../testData'
request = supertest server

describe 'Authentication', ->

  describe 'making authenticated requests', ->

    it 'responds 200 when token is valid', (done) ->
      request
      .get '/protected'
      .set 'Authorization', 'Bearer ' + token
      .expect 200, 'protected'
      .end done

    it 'responds 401 when Authorization header is not set', (done) ->
      request
      .get '/protected'
      .expect 401, 'No Authorization header found\n'
      .end done

    it 'responds 401 when token is invalid', (done) ->
      request
      .get '/protected'
      .set 'Authorization', 'Bearer invalid-token'
      .expect 401, 'Invalid token\n'
      .end done
