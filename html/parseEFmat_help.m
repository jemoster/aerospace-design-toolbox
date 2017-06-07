%% parseEFmat
% Parse the data from a file containing the output of AVL's FE
% command. 
%
%% Description
% parseEF and the other functions detailed here get a filename as an
% argument.  The file should contain the data dumped by AVL using the
% FE menu (element forces).
%
% The output is a struct with three matrices:
%
% * output.surfaces: [N1 x 13] matrix.
%
% <html>
% <div class="table-responsive"><table cellspacing="0" class="table" cellpadding="4" border="2">
% <colgroup><col width="50%"><col width="50%"></colgroup>
% <thead><tr valign="top"><th valign="top">Column Number</th><th valign="top">Value</th></tr></thead>
% <tr valign="top"><td>1</td><td>Number of elements chordwise</td></tr>
% <tr valign="top"><td>2</td><td>Number of elements spanwise</td></tr>
% <tr valign="top"><td>3</td><td>Firt strip</td></tr>
% <tr valign="top"><td>4</td><td>Surface area</td></tr>
% <tr valign="top"><td>5</td><td>Average chord</td></tr>
% <tr valign="top"><td>6</td><td>CL</td></tr>
% <tr valign="top"><td>7</td><td>CY</td></tr>
% <tr valign="top"><td>8</td><td>CD</td></tr>
% <tr valign="top"><td>9</td><td>CDi</td></tr>
% <tr valign="top"><td>10</td><td>CDv</td></tr>
% <tr valign="top"><td>11</td><td>Cl</td></tr>
% <tr valign="top"><td>12</td><td>Cm</td></tr>
% <tr valign="top"><td>13</td><td>Cn</td></tr>
% </tbody></table></div>
% </html>
%
% * output.strips: [N2 x 19] matrix.
%
% <html>
% <div class="table-responsive"><table cellspacing="0" class="table" cellpadding="4" border="2">
% <colgroup><col width="50%"><col width="50%"></colgroup>
% <thead><tr valign="top"><th valign="top">Column Number</th><th valign="top">Value</th></tr></thead>
% <tr valign="top"><td>1</td><td>Number of strip elements chordwise</td></tr>
% <tr valign="top"><td>2</td><td>Index of first vortex in surface</td></tr>
% <tr valign="top"><td>3</td><td>Xle (Leading edge X coordinate)</td></tr>
% <tr valign="top"><td>4</td><td>Yle (Leading edge Y coordinate)</td></tr>
% <tr valign="top"><td>5</td><td>Zle (Leading edge Z coordinate)</td></tr>
% <tr valign="top"><td>6</td><td>Average chord length</td></tr>
% <tr valign="top"><td>7</td><td>Strip width</td></tr>
% <tr valign="top"><td>8</td><td>Strip dihedral angle</td></tr>
% <tr valign="top"><td>9</td><td>Incidence angle</td></tr>
% <tr valign="top"><td>10</td><td>Strip area</td></tr>
% <tr valign="top"><td>11</td><td>Cl</td></tr>
% <tr valign="top"><td>12</td><td>Cd</td></tr>
% <tr valign="top"><td>13</td><td>Cdv</td></tr>
% <tr valign="top"><td>14</td><td>Cn</td></tr>
% <tr valign="top"><td>15</td><td>Ca</td></tr>
% <tr valign="top"><td>16</td><td>Cnc</td></tr>
% <tr valign="top"><td>17</td><td>Wake downwash</td></tr>
% <tr valign="top"><td>18</td><td>cmLE</td></tr>
% <tr valign="top"><td>19</td><td>cm c/4</td></tr>
% </tbody></table></div><p></p>
% </html>
%
% * output.vertices: [N3 x 6] matrix.
%
% <html>
% <div class="table-responsive"><table cellspacing="0" class="table" cellpadding="4" border="2">
% <colgroup><col width="50%"><col width="50%"></colgroup>
% <thead><tr valign="top"><th valign="top">Column Number</th><th valign="top">Value</th></tr></thead>
% <tr valign="top"><td>1</td><td>X</td></tr>
% <tr valign="top"><td>2</td><td>Y</td></tr>
% <tr valign="top"><td>3</td><td>Z</td></tr>
% <tr valign="top"><td>4</td><td>Dx</td></tr>
% <tr valign="top"><td>5</td><td>Slope</td></tr>
% <tr valign="top"><td>6</td><td>dCp</td></tr>
% </tbody></table></div>
% </html>
%
% The N-th row of each matrix corresponds to the data of the N-th
% element (surface/strip/vortex).
%
%% Definitions
%
%
%% Example

myEF = parseEFmat('plane0102.ef');

%Access matrices with aerodynamic and geometric data like this:
surfacesData = myEF.surfaces;
stripsData = myEF.strips;
verticesData = myEF.vertices;

%% See also
% <parseSB_help.html |parseSB|>,
% <parseST_help.html |parseST|>,
% <parseConfig_help.html |parseSF|>
%
% _Copyright 2017 Gypaets_
