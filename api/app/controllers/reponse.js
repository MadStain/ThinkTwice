/*
 * This file is part of ThinkTwice.
 * 
 * Copyright (c) 2016 Antoine Drouhin <antoine.drouhin@gmail.com>, Geoffrey Harrazi <geoffreyharrazi@gmail.com>, Annas Saker
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
 
var ReponseController = exports;



//--------------------------------------- Module dependencies.

var     moment          = require('moment'),
        Utils           = require('../helpers/appUtils');
        Personnalite    = require("../models/personnalite.js");
        Facette         = require("../models/facette.js");


/**
 * Load all people
 * @param req
 * @param res
 */
/*ReponseController.pushData = function(req, res){

    Utils.info("Form are pushed to the server.");

    if (req.body) {
        ReponseController.calcFacette(req.body.id_personne, req.body.reponses, ReponseController.calcPersonnalite);
        //ReponseController.calcPersonnalite(req.body.id_personne, req.body.reponses);
    } else {
        Utils.info("No body present in pushed data.");
    }
};*/

ReponseController.pushData = function(req, res){

    Utils.info("Form are pushed to the server.");

    if (req.body) {
        ReponseController.calcFacette(req.body.id_personne, req.body.reponses, ReponseController.calcPersonnalite);
        //ReponseController.calcPersonnalite(req.body.id_personne, req.body.reponses);
        res.status(200).json({error : false});
    } else {
        Utils.info("No body present in pushed data.");
    }
};

ReponseController.calcFacette = function(p, data) {
    var f = new Facette(p, data, ReponseController.calcPersonnalite);
    f.calc();
}

ReponseController.calcPersonnalite = function(p, data) {
    var p = new Personnalite(p, data);
    p.calc();
}
