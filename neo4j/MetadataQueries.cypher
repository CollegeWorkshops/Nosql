PLATFORM --->
CREATE (g:PLATFORM {type:'PC'}) RETURN g
CREATE (g:PLATFORM {type:'PSP'}) RETURN g
CREATE (g:PLATFORM {type:'PS2'}) RETURN g
CREATE (g:PLATFORM {type:'PS3'}) RETURN g
CREATE (g:PLATFORM {type:'XBOX 360'}) RETURN g
CREATE INDEX on :PLATFORM(type)
CREATE CONSTRAINT ON (p:PLATFORM) ASSERT p.type IS UNIQUE;

Publishers --->
CREATE (g:PUBLISHER {name:'Electronic Arts'}) RETURN g;
CREATE (g:PUBLISHER {name:'EA Games'}) RETURN g;
CREATE (g:PUBLISHER {name:'EPIC Games'}) RETURN g;
CREATE (g:PUBLISHER {name:'Quantic Dream'}) RETURN g;

CREATE (g:PUBLISHER {name:'Capcom'}) RETURN g;
CREATE (g:PUBLISHER {name:'Microsoft Studios'}) RETURN g;
CREATE (g:PUBLISHER {name:'Valve'}) RETURN g;
CREATE (g:PUBLISHER {name:'Sony Computer Entertainment'}) RETURN g;
CREATE (g:PUBLISHER {name:'2K games'}) RETURN g;
CREATE (g:PUBLISHER {name:'Rockstar Games'}) RETURN g;
CREATE (g:PUBLISHER {name:'Eidos Interactive'}) RETURN g;
CREATE (g:PUBLISHER {name:'Square Enix'}) RETURN g;
CREATE (g:PUBLISHER {name:'Santa Monica Studios'}) RETURN g;
CREATE (g:PUBLISHER {name:'Ubisoft'}) RETURN g;
CREATE INDEX on :PUBLISHER(name)
CREATE CONSTRAINT ON (p:PUBLISHER) ASSERT p.name IS UNIQUE;


PEGI -->
CREATE (g:PEGI {rating:'3'}) RETURN g;
CREATE (g:PEGI {rating:'7'}) RETURN g;
CREATE (g:PEGI {rating:'12'}) RETURN g;
CREATE (g:PEGI {rating:'16'}) RETURN g;
CREATE (g:PEGI {rating:'18'}) RETURN g;
CREATE INDEX on :PEGI(rating)
CREATE CONSTRAINT ON (p:PEGI) ASSERT p.name IS UNIQUE;

Genre --->
CREATE (g:GENRE {name:'Adventure'}) RETURN g;
CREATE (g:GENRE {name:'Hack and Slash'}) RETURN g;
CREATE (g:GENRE {name:'Third Person Shooter'}) RETURN g;
CREATE (g:GENRE {name:'First Person Shooter - FPS'}) RETURN g;
CREATE (g:GENRE {name:'Multiplayer'}) RETURN g;
CREATE (g:GENRE {name:'Racing'}) RETURN g;
CREATE (g:GENRE {name:'Action'}) RETURN g;
CREATE (g:GENRE {name:'Beat em up'}) RETURN g;
CREATE (g:GENRE {name:'Interactive Drama'}) RETURN g;
CREATE (g:GENRE {name:'Stealth'}) RETURN g;
CREATE (g:GENRE {name:'Real Time Strategy'}) RETURN g;
CREATE (g:GENRE {name:'Puzzle'}) RETURN g;
CREATE (g:GENRE {name:'Role Playing Game'}) RETURN g;
CREATE (g:GENRE {name:'Open World'}) RETURN g;
CREATE (g:GENRE {name:'Sport'}) RETURN g;
CREATE CONSTRAINT ON (genre:GENRE) ASSERT genre.name IS UNIQUE