var game = new Phaser.Game(288,520,Phaser.AUTO,'game'); 
game.States = {};

game.States.boot = function(){

	this.create = function(){
		game.state.start('preload'); 
	};
}

game.States.preload = function(){
	this.preload = function(){

		//load images into the game
		game.load.image('background','assets/background.png'); 
    	game.load.image('road','assets/ground.png'); 
        game.load.spritesheet('bird','assets/tissue.png',57,42,3); 
    	game.load.image('btn','assets/start-button.png');  
    	game.load.spritesheet('pipe','assets/pipes.png',54,320,2); 
    	game.load.bitmapFont('flappy_font', 'assets/fonts/flappyfont/flappyfont.png', 'assets/fonts/flappyfont/flappyfont.fnt');

    	game.load.image('ready_text','assets/get-ready.png');
    	//game.load.image('play_tip','assets/instructions.png');
    	game.load.image('game_over','assets/gameover.png');
    	game.load.image('score_board','assets/scoreboard.png');
	}
    
    //call the plan function
	this.create = function(){
		game.state.start('play');
	}
    
}

game.States.play = function(){
	this.create = function(){
		this.bg = game.add.tileSprite(0,0,game.width,game.height,'background');
		this.pipeGroup = game.add.group();//add a pipe group that groups the pipes
		this.pipeGroup.enableBody = true;
		this.ground = game.add.tileSprite(0,game.height-112,game.width,112,'road');
        this.getReady = game.add.tileSprite(0,0,184,52,'ready_text');
        this.getReady.anchor.setTo(-0.3,-4.5);
		this.bird = game.add.sprite(50,150,'bird'); 
		this.bird.animations.add('fly');
		this.bird.animations.play('fly',12,true);
		this.bird.anchor.setTo(0.5, 0.5);
		game.physics.enable(this.bird,Phaser.Physics.ARCADE); //open tissue's physical system
		this.bird.body.gravity.y = 0; //tissue wont move before game starts
		game.physics.enable(this.ground,Phaser.Physics.ARCADE);
		this.ground.body.immovable = true; 

		this.scoreText = game.add.bitmapText(game.world.centerX-20, 30, 'flappy_font', '0', 36);

		this.hasStarted = false; //game hasn't started at this point
		game.time.events.loop(900, this.generatePipes, this);//timer
		game.time.events.stop(false);
		game.input.onDown.addOnce(this.statrGame, this);//click to start
        
	};
    
	this.update = function(){
        
		game.physics.arcade.collide(this.bird,this.ground, this.hitGround, null, this); //collapes with ground
		game.physics.arcade.overlap(this.bird, this.pipeGroup, this.hitPipe, null, this); //collapes with pipes
		if(this.bird.angle < 90) this.bird.angle += 1.5; //animation
		this.pipeGroup.forEachExists(this.checkScore,this); //check score
	}

    this.generatePipes = function(gap){ 
		gap = gap || 100; //gap between pipes
		var gapPosition = (505 - 320 - gap) + Math.floor((505 - 112 - 30 - gap - 505 + 320 + gap) * Math.random());//randomzie gap position
		var topPipeY = gapPosition-360;
		var bottomPipeY = gapPosition+gap;

		
		var topPipe = game.add.sprite(game.width, topPipeY, 'pipe', 0, this.pipeGroup);
		var bottomPipe = game.add.sprite(game.width, bottomPipeY, 'pipe', 1, this.pipeGroup);
		this.pipeGroup.setAll('checkWorldBounds',true);
		this.pipeGroup.setAll('outOfBoundsKill',true);
		this.pipeGroup.setAll('body.velocity.x', -this.gameSpeed);
	}
    
	this.statrGame = function(){
		this.gameSpeed = 200; 
		this.gameIsOver = false;
		this.hasHitGround = false;
		this.score = 0;//set score to 0
		
		this.bird.body.gravity.y = 1000; //add gravity to the tissue
		this.getReady.destroy();
		//this.playTip.destroy();
		game.input.onDown.add(this.fly, this);//click to fly once
		game.time.events.start();
	}

    
	this.stopGame = function(){
		game.time.events.stop(true);
		this.pipeGroup.forEachExists(function(pipe){
			pipe.body.velocity.x = 0;
		}, this);//stop moving pipes
		this.bird.animations.stop('fly', 0);
		game.input.onDown.remove(this.fly,this);//make sure the tisse can't move after died
        	
	}

    
	this.fly = function(){
		this.bird.body.velocity.y = -350;
		game.add.tween(this.bird).to({angle:-25}, 100, null, true, 0, 0, false); 
	
	}

	this.hitPipe = function(){
		if(this.gameIsOver) return;

		this.gameOver();//move to gameOver function
	}
    
	this.hitGround = function(){
		if(this.hasHitGround) return; 
		this.hasHitGround = true;
        
		this.gameOver(true);
	}
    
	this.gameOver = function(show_text){
		this.gameIsOver = true;
		this.stopGame();
		if(show_text) 
            this.showGameOverText();
        
	};


	this.showGameOverText = function(){
		this.scoreText.destroy();
		game.bestScore = game.bestScore || 0;
		if(this.score > game.bestScore) game.bestScore = this.score; 
		this.gameOverGroup = game.add.group();
		var gameOverText = this.gameOverGroup.create(game.width/2,0,'game_over'); 
		var scoreboard = this.gameOverGroup.create(game.width/2,70,'score_board'); 
		var currentScoreText = game.add.bitmapText(game.width/2 + 60, 105, 'flappy_font', this.score+'', 20, this.gameOverGroup); 
		var bestScoreText = game.add.bitmapText(game.width/2 + 60, 153, 'flappy_font', game.bestScore+'', 20, this.gameOverGroup); 
		var replayBtn = game.add.button(game.width/2, 210, 'btn', function(){ //replay
			game.state.start('play');
		}, this, null, null, null, null, this.gameOverGroup);
		gameOverText.anchor.setTo(0.5, 0);
		scoreboard.anchor.setTo(0.5, 0);
		replayBtn.anchor.setTo(0.5, 0);
		this.gameOverGroup.y = 30;
	}

	
    //updates score
	this.checkScore = function(pipe){
		if(!pipe.hasScored && pipe.y<=0 && pipe.x<=this.bird.x-17-54){
			pipe.hasScored = true;
			this.scoreText.text = ++this.score;
			return true;
		}
		return false;
	}
}


game.state.add('boot',game.States.boot);
game.state.add('preload',game.States.preload);

game.state.add('play',game.States.play);
game.state.start('boot'); 

