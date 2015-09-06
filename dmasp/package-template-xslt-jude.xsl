<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" method="xml" standalone="yes" indent="yes" />
	<xsl:template match="/">
		<xsl:for-each select="project">
			<xsl:element name="Package" namespace="UML" />
			<xsl:element name="ModelElement.namespace" namespace="UML" />
			<xsl:element name="Namespace" namespace="UML" />
			<xsl:element name="ModelElement.visibility" namespace="UML" />
			<xsl:element name="Namespace.ownedElement" namespace="UML" />
			<xsl:element name="Class" namespace="UML" />
			
			<xsl:call-template name="lineJump"/>
			<xsl:text>            </xsl:text>
			<xsl:element name="UML:Package">
				<xsl:attribute name="xmi.id">
					<xsl:text>Java_Packages</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="name">
					<xsl:text>Packages</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="version">
					<xsl:text>0</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="unSolvedFlag">
					<xsl:text>false</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="isRoot">
					<xsl:text>true</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="isLeaf">
					<xsl:text>false</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="isAbstract">
					<xsl:text>false</xsl:text>
				</xsl:attribute>

				<xsl:call-template name="lineJump"/>
				<xsl:text>              </xsl:text>
				<xsl:element name="UML:ModelElement.namespace">

					<xsl:call-template name="lineJump"/>
					<xsl:text>                </xsl:text>
					<xsl:element name="UML:Namespace">
						<xsl:attribute name="xmi.idref">
							<xsl:text>1071c84-fed3deb4f2-e12556edfc4798525298ccf2388f7db7</xsl:text>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:call-template name="lineJump"/>
				<xsl:text>              </xsl:text>
				<xsl:element name="UML:ModelElement.visibility">
					<xsl:attribute name="xmi.value">
						<xsl:text>public</xsl:text>
					</xsl:attribute>
				</xsl:element>

				<xsl:call-template name="lineJump"/>
				<xsl:text>              </xsl:text>

				<xsl:element name="UML:Namespace.ownedElement">
					<xsl:for-each select="./types/type">
					
							<xsl:if test="./primitive='false'">
								<xsl:if test="./user='false'">
					
									<xsl:call-template name="lineJump"/>
									<xsl:text>                </xsl:text>
									<xsl:element name="UML:Class">
										<xsl:attribute name="xmi.id">
											<xsl:text>packages_</xsl:text>
											<xsl:value-of select="id" />
										</xsl:attribute>
										<xsl:attribute name="name">
											<xsl:value-of select="name" />
										</xsl:attribute>
										<xsl:attribute name="version">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="unSolvedFlag">
										<xsl:text>false</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="isRoot">
										<xsl:text>false</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="isLeaf">
											<xsl:text>false</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="isAbstract">
											<xsl:text>false</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="isActive">
											<xsl:text>false</xsl:text>
										</xsl:attribute>
								
										<xsl:call-template name="lineJump"/>
										<xsl:text>                  </xsl:text>
										<xsl:element name="UML:ModelElement.namespace">
											<xsl:call-template name="lineJump"/>
											<xsl:text>                    </xsl:text>
											<xsl:element name="UML:Namespace">
												<xsl:attribute name="xmi.idref">
													<xsl:text>Java_Packages</xsl:text>
												</xsl:attribute>
											</xsl:element>
										</xsl:element>
		
										<xsl:call-template name="lineJump"/>
										<xsl:text>                  </xsl:text>
										<xsl:element name="UML:ModelElement.visibility">
											<xsl:attribute name="xmi.value">
												<xsl:text>public</xsl:text>
											</xsl:attribute>
										</xsl:element>
									</xsl:element>
								</xsl:if>
							</xsl:if>
					</xsl:for-each>
				</xsl:element>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>

<xsl:template name=	"lineJump">
<xsl:text>
</xsl:text>
</xsl:template>

</xsl:stylesheet>