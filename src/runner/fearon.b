addNpcDef({
    name: "Fearon",
    label: "fearon",
    creature: "beard",
    convo: {
        "": "grrrr",
    },
    waypoints: [ [ 5593, 6698, 1 ] ],
    schedule: [
        { name: "room", from: 0, to: 23, movement: "anchor", waypointDir: -1 },
    ],    
});
