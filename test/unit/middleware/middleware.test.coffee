middleware = null
bufferSpy = null

describe 'Middleware module', ->

  beforeEach ->
    bufferSpy = sinon.spy global, 'Buffer'
    delete require.cache[require.resolve '../../../src/middleware/middleware']

  afterEach ->
    Buffer.restore()

  it 'exists', ->
    expect(require '../../../src/middleware/middleware').to.exist

  it 'sets JWT env var to test if not already set', ->
    process.env.JWT = ''
    middleware = require '../../../src/middleware/middleware'
    expect(bufferSpy).to.have.been.calledOnce
    expect(bufferSpy).to.have.been.calledWith 'test'

  it 'uses the JWT env var if already set', ->
    process.env.JWT = 'test2'
    middleware = require '../../../src/middleware/middleware'
    expect(bufferSpy).to.have.been.calledOnce
    expect(bufferSpy).to.have.been.calledWith 'test2'
