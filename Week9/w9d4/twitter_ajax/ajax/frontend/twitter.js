const FollowToggle = require('./follow_toggle.js');

$('button.follow-toggle').each(  (i, button) => new FollowToggle(button, {}) );