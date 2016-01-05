errors = require '../../../src/services/errors'

describe 'Errors Service', ->

  logSpy = null

  it 'exists', ->
    expect(errors).to.exist

  beforeEach ->
    logSpy = sinon.spy console, 'log'

  afterEach ->
    console.log.restore()

  describe 'uncaught exceptions', ->

    originalExit = process.exit
    exitStub = sinon.stub()
    handler = null

    beforeEach ->
      exitStub.reset()
      process.exit = exitStub
      handler = process.listeners('uncaughtException')[0]

    afterEach ->
      process.exit = originalExit

    it 'logs out the error stack if possible', ->
      handler stack: 'test error'
      expect(logSpy).to.have.been.calledOnce
      expect(logSpy).to.have.been.calledWith 'uncaught exception: test error'

    it 'logs out the error message if no stack trace', ->
      handler 'test error2'
      expect(logSpy).to.have.been.calledOnce
      expect(logSpy).to.have.been.calledWith 'uncaught exception: test error2'

    it 'exits the process with status code 1', ->
      handler 'test'
      expect(exitStub).to.have.been.calledOnce
      expect(exitStub).to.have.been.calledWith 1

  describe 'uncaught exceptions', ->

    it 'logs out the error stack if possible', ->
      errors.onPossiblyUnhandledRejectionHandler 'test error3'
      expect(logSpy).to.have.been.calledOnce
      expect(logSpy).to.have.been.calledWith 'Possibly unhandled bluebird exception: test error3'
