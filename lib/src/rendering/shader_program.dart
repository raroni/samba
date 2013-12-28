part of samba;

class ShaderProgram {
  web_gl.RenderingContext _context;
  web_gl.Program _handle;
  
  ShaderProgram(web_gl.RenderingContext context, vertexShaderSource, String fragmentShaderSource) {
    _context = context;
    
    web_gl.Shader vertexShaderHandle = createShader(web_gl.VERTEX_SHADER, vertexShaderSource);
    web_gl.Shader fragmentShaderHandle = createShader(web_gl.FRAGMENT_SHADER, fragmentShaderSource);
        
    _handle = context.createProgram();
    context.attachShader(_handle, vertexShaderHandle);
    context.attachShader(_handle, fragmentShaderHandle);
    
    context.linkProgram(_handle);
    
    if (!context.getProgramParameter(_handle, web_gl.LINK_STATUS)) {
      print("Linking error: " + context.getProgramInfoLog(_handle));
    }
  }
  
  web_gl.Shader createShader(int type, String source) {
    web_gl.Shader handle = _context.createShader(type);
    _context.shaderSource(handle, source);
    _context.compileShader(handle);
    
    if(!_context.getShaderParameter(handle, web_gl.COMPILE_STATUS)) {
      print("Shader compile error: " + _context.getShaderInfoLog(handle));
    }
    
    return handle;
  }
}
