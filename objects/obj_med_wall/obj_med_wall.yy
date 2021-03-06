{
  "spriteId": {
    "name": "spr_med_wall",
    "path": "sprites/spr_med_wall/spr_med_wall.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "pr_entity",
    "path": "objects/pr_entity/pr_entity.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"parent":{"name":"obj_med_wall","path":"objects/obj_med_wall/obj_med_wall.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":1,"collisionObjectId":null,"parent":{"name":"obj_med_wall","path":"objects/obj_med_wall/obj_med_wall.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [],
  "overriddenProperties": [
    {"propertyId":{"name":"entity_collision","path":"objects/pr_entity/pr_entity.yy",},"objectId":{"name":"pr_entity","path":"objects/pr_entity/pr_entity.yy",},"value":"True","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entity_hit_script","path":"objects/pr_entity/pr_entity.yy",},"objectId":{"name":"pr_entity","path":"objects/pr_entity/pr_entity.yy",},"value":"entity_hit_destroy","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entity_fragment_count","path":"objects/pr_entity/pr_entity.yy",},"objectId":{"name":"pr_entity","path":"objects/pr_entity/pr_entity.yy",},"value":"2","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entity_fragment","path":"objects/pr_entity/pr_entity.yy",},"objectId":{"name":"pr_entity","path":"objects/pr_entity/pr_entity.yy",},"value":"[obj_med_wall_frag, obj_keycard,]","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "entities",
    "path": "folders/Objects/entities.yy",
  },
  "resourceVersion": "1.0",
  "name": "obj_med_wall",
  "tags": [],
  "resourceType": "GMObject",
}