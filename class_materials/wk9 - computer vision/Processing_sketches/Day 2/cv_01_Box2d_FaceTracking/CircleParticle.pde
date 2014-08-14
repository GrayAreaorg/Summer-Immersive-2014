// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// Box2DProcessing example

// A circle
class CircleParticle {

  // We need to keep track of a Body and a width and height
  Body body;
  float radius;


  // Constructor
 CircleParticle(float x, float y, float r) {

    radius = r ;
    // Add the box to the box2d world
    makeBody(new Vec2(x,y), r );
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    // Is it off the bottom of the screen?
    if (pos.y > height+radius ) {
      killBody();
      return true;
    }
    return false;
  }

  void attract(float x,float y) {
    // From BoxWrap2D example
    Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);   
    Vec2 bodyVec = body.getWorldCenter();
    // First find the vector going from this body to the specified point
    worldTarget.subLocal(bodyVec);
    // Then, scale the vector to the specified force
    worldTarget.normalize();
    worldTarget.mulLocal((float) 50);
    // Now apply it to the body's center of mass.
    body.applyForce(worldTarget, bodyVec);
  }


  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
      translate(pos.x,pos.y);
      rotate(-a);
      fill(175);
      stroke(0);
      ellipse( 0 , 0 , radius , radius );
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float r_ ) {

    // Define a polygon (this is what we use for a rectangle)
    CircleShape circle = new CircleShape();
    circle.m_radius = box2d.scalarPixelsToWorld( r_ );
    circle.m_p.set(center.x,center.y);
   
    //sd.setAsCircle( box2dR ) ;
    //sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = circle;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(circle , 1.0f );
  }
}

