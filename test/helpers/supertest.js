var events = require('events')
events.EventEmitter.prototype._maxListeners = 10000
global.supertest = require('supertest')
