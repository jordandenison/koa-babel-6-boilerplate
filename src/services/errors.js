const errors = {
  serverErrorHandler () {
    return function *(next){
      try {
        yield next
      } catch (err) {
        this.status = err.status
        this.body = err.message
        this.app.emit('error', err, this)
      }
    }
  },
  onPossiblyUnhandledRejectionHandler (err) {
    console.log('Possibly unhandled bluebird exception: ' + (err && err.stack || err))
  },
  uncaughtExceptionHandler (err) {
    console.log('uncaught exception: ' + (err && err.stack || err))
    process.exit(1)
  }
}

module.exports = errors
