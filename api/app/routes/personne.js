/*
 * This file is part of ThinkTwice.
 * 
 * Copyright (c) 2016 Antoine Drouhin <antoine.drouhin@gmail.com>, Geoffrey Harrazi <geoffreyharrazi@gmail.com>, Annas Saker
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

'use strict';

module.exports = function(router) {
    //------ LOAD CONTROLLER
    var personneController = require('../controllers/personne'),
        auth              = require('../helpers/auth');

    // -------- Retrieve all person from the database
    router.post('/personne', personneController.register);

    router.put('/personne', auth.isAuth, personneController.update);

    router.get('/personne/:id', auth.isAuth, personneController.get);

};