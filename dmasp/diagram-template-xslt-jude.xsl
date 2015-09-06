<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" method="xml" standalone="yes" indent="yes" />
	<xsl:template match="/">
		<xsl:for-each select="project">
			<xsl:element name="Class" namespace="UML" />
			<xsl:element name="ModelElement.namespace" namespace="UML" />
			<xsl:element name="Namespace" namespace="UML" />
			<xsl:element name="Classifier.feature" namespace="UML" />
			<xsl:element name="Attribute" namespace="UML" />
			<xsl:element name="ModelElement.visibility" namespace="UML" />
			<xsl:element name="ModelElement.taggedValue" namespace="UML" />
			<xsl:element name="TaggedValue" namespace="UML" />
			<xsl:element name="TaggedValue.modelElement" namespace="UML" />
			<xsl:element name="ModelElement" namespace="UML" />
			<xsl:element name="Feature.owner" namespace="UML" />
			<xsl:element name="Classifier" namespace="UML" />
			<xsl:element name="Feature.visibility" namespace="UML" />
			<xsl:element name="StructuralFeature.type" namespace="UML" />
			<xsl:element name="extension" namespace="XMI" />
			<xsl:element name="Diagram" namespace="JUDE" />
			<xsl:element name="Diagram.presentations" namespace="JUDE" />
			<xsl:element name="FramePresentation" namespace="JUDE" />
			<xsl:element name="UPresentation.diagram" namespace="JUDE" />
			<xsl:element name="JomtPresentation.location" namespace="JUDE" />
			<xsl:element name="field" namespace="XMI" />			
			<xsl:element name="ClassifierPresentation" namespace="JUDE" />
			<xsl:element name="UPresentation.semanticModel" namespace="JUDE" />
			<xsl:element name="UPresentation.customStyleMap" namespace="JUDE" />
			<xsl:element name="UPresentation.styleProperty" namespace="JUDE" />
			<xsl:element name="Diagram.customStyleMap" namespace="JUDE" />
			<xsl:element name="Diagram.styleProperty" namespace="JUDE" />
			<xsl:element name="Primitive" namespace="UML" />
			<xsl:element name="UPresentation.location" namespace="JUDE" />
			<xsl:element name="Operation" namespace="UML" />
			<xsl:element name="BehavioralFeature.parameter" namespace="UML" />
			<xsl:element name="Parameter" namespace="UML" />
			<xsl:element name="Parameter.behavioralFeature" namespace="UML" />
			<xsl:element name="Parameter.type" namespace="UML" />
			<xsl:element name="BehavioralFeature" namespace="UML" />
			<xsl:element name="Stereotype" namespace="UML" />
			<xsl:element name="Stereotype.baseClass" namespace="UML" />
			<xsl:element name="Stereotype.extendedElement" namespace="UML" />
			<xsl:element name="ModelElement.stereotype" namespace="UML" />
			<xsl:element name="Association" namespace="UML" />
			<xsl:element name="Association.connection" namespace="UML" />
			<xsl:element name="AssociationEnd" namespace="UML" />
			<xsl:element name="StructuralFeature.multiplicity" namespace="UML" />
			<xsl:element name="Multiplicity" namespace="UML" />
			<xsl:element name="Multiplicity.range" namespace="UML" />
			<xsl:element name="MultiplicityRange" namespace="UML" />
			<xsl:element name="AssociationEnd.participant" namespace="UML" />
			<xsl:element name="AssociationEnd.association" namespace="UML" />
			<xsl:element name="AssociationEnd.visibility" namespace="UML" />
			<xsl:element name="AssociationEnd.association" namespace="UML" />
			<xsl:element name="AssociationEnd" namespace="UML" />
			<xsl:element name="AssociationPresentation" namespace="JUDE" />
			<xsl:element name="UPresentation.servers" namespace="JUDE" />
			<xsl:element name="PathPresentation.namePresentation" namespace="JUDE" />
			<xsl:element name="LabelPresentation" namespace="JUDE" />
			<xsl:element name="JomtPresentation.compositeParent" namespace="JUDE" />
			<xsl:element name="UPresentation" namespace="JUDE" />
			<xsl:element name="BinaryRelationPresentation.sourceEnd" namespace="JUDE" />
			<xsl:element name="BinaryRelationPresentation.targetEnd" namespace="JUDE" />
			<xsl:element name="PathPresentation.points" namespace="JUDE" />
			<xsl:element name="AssociationPresentation.qualifierBoxAPresentation" namespace="JUDE" />
			<xsl:element name="AssociationPresentation.qualifierBoxBPresentation" namespace="JUDE" />
			<xsl:element name="QualifierBoxPresentation" namespace="JUDE" />
			<xsl:element name="UPresentation.clients" namespace="JUDE" />
			<xsl:element name="ModelElement.clientDependency" namespace="UML" />
			<xsl:element name="Dependency" namespace="UML" />
			<xsl:element name="Dependency.client" namespace="UML" />
			<xsl:element name="Dependency.supplier" namespace="UML" />
			<xsl:element name="DependencyPresentation" namespace="JUDE" />
			
			
			
			<xsl:for-each select="./packages/package/classes/class">
				<xsl:call-template name="lineJump"/>
				<xsl:text>        </xsl:text>
				<xsl:element name="UML:Class">
					<xsl:attribute name="xmi.id">
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
					<xsl:text>          </xsl:text>
					<xsl:element name="UML:ModelElement.namespace">

						<xsl:call-template name="lineJump"/>
						<xsl:text>            </xsl:text>
						<xsl:element name="UML:Namespace">
							<xsl:attribute name="xmi.idref">
								<xsl:text>0-fxdi7ror--vt5o6g--zcej9x-4fa0256f5c54d6d1903568de23302b4c</xsl:text>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>

					<xsl:call-template name="lineJump"/>
					<xsl:text>          </xsl:text>
					<xsl:element name="UML:ModelElement.visibility">
						<xsl:attribute name="xmi.value">
							<xsl:text>public</xsl:text>
						</xsl:attribute>
					</xsl:element>

					<xsl:call-template name="lineJump"/>
					<xsl:text>          </xsl:text>
					<xsl:element name="UML:Classifier.feature">

						<xsl:call-template name="includeAttributes"/>

						<xsl:call-template name="includeOperations"/>
						
					</xsl:element>
					
					
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:ModelElement.stereotype">
					
						<xsl:for-each select="./concerns/concern">
							<xsl:call-template name="lineJump"/>
							<xsl:text>                </xsl:text>
							<xsl:element name="UML:Stereotype">
								<xsl:attribute name="xmi.idref">
									<xsl:text>stereotype_</xsl:text>
									<xsl:value-of select="id" />
									<xsl:text>_</xsl:text>
									<xsl:value-of select="../../id" />
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
						
					</xsl:element>







					
					<!-- novo -->
					
					<xsl:element name="UML:ModelElement.clientDependency">
						<xsl:variable name="identifier1" select="id" /> 
						<xsl:for-each select="../../../../dependencies/dependency">
							<xsl:if test="$identifier1=idClass1">
								<xsl:element name="UML:Dependency">
									<xsl:attribute name="xmi.idref">
										<xsl:value-of select="id" />
									</xsl:attribute>
								</xsl:element>
							</xsl:if>
						</xsl:for-each>
					</xsl:element>
					
					
					
					<!-- novo -->
					
					
					
					
				</xsl:element>
			</xsl:for-each>
			
			
			<!-- novo -->
			
			<xsl:call-template name="includeDependencies"/>
			
			<!-- novo -->

			<xsl:call-template name="includeAssociations"/>

			<xsl:for-each select="./packages/package/classes/class">
				<xsl:for-each select="./concerns/concern">
					<xsl:call-template name="includeStereotypesInClass"/>
				</xsl:for-each>
			</xsl:for-each>

			<xsl:for-each select="./packages/package/classes/class/attributes/attribute">
				<xsl:for-each select="./concerns/concern">
					<xsl:call-template name="includeStereotypesInAttribute"/>
				</xsl:for-each>
			</xsl:for-each>
			
			<xsl:for-each select="./packages/package/classes/class/operations/operation">
				<xsl:for-each select="./concerns/concern">
					<xsl:call-template name="includeStereotypesInOperation"/>
				</xsl:for-each>
			</xsl:for-each>
			
			<xsl:for-each select="./dependencies/dependency">
				<xsl:for-each select="./concerns/concern">
					<xsl:call-template name="includeStereotypesInDependency"/>
				</xsl:for-each>
			</xsl:for-each>

			<xsl:call-template name="includePrimitiveTypes"/>
			
			<xsl:call-template name="lineJump"/>
			<xsl:text>    </xsl:text>
			<xsl:element name="XMI.extension" />
			<xsl:call-template name="lineJump"/>
			<xsl:text>    </xsl:text>
			<xsl:element name="XMI.extension">
				<xsl:call-template name="lineJump"/>
				<xsl:text>      </xsl:text>
				<xsl:element name="JUDE:Diagram">
					<xsl:attribute name="xmi.id">
						<xsl:text>Class_Diagram</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:text>Class_Diagram</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="typeInfo">
						<xsl:text>Class Diagram</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="version">
						<xsl:text>0</xsl:text>
					</xsl:attribute>
					
<!--	FORA		<xsl:attribute name="xmlns:JUDE">
						<xsl:text>http://objectclub.esm.co.jp/Jude/namespace/</xsl:text>
					</xsl:attribute>-->
					
					<xsl:call-template name="lineJump"/>
					<xsl:text>        </xsl:text>
					<xsl:element name="UML:ModelElement.namespace">
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="UML:Namespace">
							<xsl:attribute name="xmi.idref">
								<xsl:text>0-fxdi7ror--vt5o6g--zcej9x-4fa0256f5c54d6d1903568de23302b4c</xsl:text>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>        </xsl:text>
					<xsl:element name="JUDE:Diagram.presentations">
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:FramePresentation">
							<xsl:attribute name="xmi.id">
								<xsl:text>4yu-fxdi7ror--vt5o6g--zcej9x-4fa0256f5c54d6d1903568de23302b4c</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="version">
								<xsl:text>0</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="depth">
								<xsl:text>2147483636</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="stereotypeVisibility">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="constraintVisibility">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="notationType">
								<xsl:text>0</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="width">
								<xsl:text>640.0</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="height">
								<xsl:text>480.0</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="doAutoResize">
								<xsl:text>false</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="visibility">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="label">
								<xsl:text>+</xsl:text>
							</xsl:attribute>
							<xsl:call-template name="lineJump"/>
							<xsl:text>            </xsl:text>
							<xsl:element name="JUDE:UPresentation.diagram">
								<xsl:call-template name="lineJump"/>
								<xsl:text>              </xsl:text>
								<xsl:element name="JUDE:Diagram">
									<xsl:attribute name="xmi.idref">
										<xsl:text>Class_Diagram</xsl:text>
									</xsl:attribute>
								</xsl:element>
							</xsl:element>
							<xsl:call-template name="lineJump"/>
							<xsl:text>            </xsl:text>
							<xsl:element name="JUDE:JomtPresentation.location">
								<xsl:call-template name="lineJump"/>
								<xsl:text>              </xsl:text>
								<xsl:element name="XMI.field">
									<xsl:text>10.0</xsl:text>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>              </xsl:text>
								<xsl:element name="XMI.field">
									<xsl:text>10.0</xsl:text>
								</xsl:element>
							</xsl:element>
						</xsl:element>
						
						
						
						<xsl:for-each select="./packages/package/classes/class">
							<xsl:call-template name="lineJump"/>
							<xsl:text>          </xsl:text>
							<xsl:element name="JUDE:ClassifierPresentation">
								<xsl:attribute name="xmi.id">
									<xsl:text>classifierPresentation_</xsl:text>
									<xsl:value-of select="id" />
								</xsl:attribute>
								<xsl:attribute name="version">
									<xsl:text>0</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="depth">
									<xsl:text>2147483634</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="stereotypeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="constraintVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="notationType">
									<xsl:text>0</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="width">
									<xsl:text>66.0</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="height">
									<xsl:text>42.09375</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="doAutoResize">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="visibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="label">
									<xsl:value-of select="name" />
								</xsl:attribute>
								<xsl:attribute name="isActive">
									<xsl:text>false</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="allAttributeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="allOperationVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="visibilityKindVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="attributeTypeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="parameterVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="parameterTypeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="returnTypeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="isClassNameItalic">
									<xsl:text>false</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="attributeInitValueVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="pathVisibility">
									<xsl:text>0</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="attributeStereotypeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="operationStereotypeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="attributeConstraintVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="operationConstraintVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="publicAttributeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="protectedAttributeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="packageAttributeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="privateAttributeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="publicOperationVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="protectedOperationVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="packageOperationVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="privateOperationVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="classType">
									<xsl:text>0</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="interfaceType">
									<xsl:text>0</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="nameVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="templateParameterVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="templateParameterMultiline">
									<xsl:text>false</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="boundClassTemplateParameterNameVisibility">
									<xsl:text>false</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="boundClassTemplateParameterVisibility">
									<xsl:text>false</xsl:text>
								</xsl:attribute>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.semanticModel">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="UML:Class">
										<xsl:attribute name="xmi.idref">
											<xsl:value-of select="id" />
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.diagram">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:Diagram">
										<xsl:attribute name="xmi.idref">
											<xsl:text>Class_Diagram</xsl:text>
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
								
								
								
								<!-- novo -->
								
								
								<xsl:variable name="identifier2" select="id" /> 

								<xsl:for-each select="../../../../dependencies/dependency">
									<xsl:call-template name="lineJump"/>
									<xsl:text>            </xsl:text>
									<xsl:element name="JUDE:UPresentation.clients">
									<xsl:if test="$identifier2=idClass1">
										<xsl:call-template name="lineJump"/>
										<xsl:text>              </xsl:text>
										<xsl:element name="JUDE:DependencyPresentation">
											<xsl:attribute name="xmi.idref">
												<xsl:text>dependencyPresentation_</xsl:text>
												<xsl:value-of select="id" />
											</xsl:attribute>
										</xsl:element>
									</xsl:if>
									<xsl:if test="$identifier2=idClass2">
										<xsl:call-template name="lineJump"/>
										<xsl:text>              </xsl:text>
										<xsl:element name="JUDE:DependencyPresentation">
											<xsl:attribute name="xmi.idref">
												<xsl:text>dependencyPresentation_</xsl:text>
												<xsl:value-of select="id" />
											</xsl:attribute>
										</xsl:element>
									</xsl:if>
									</xsl:element>
								</xsl:for-each>
								
								
								<!-- novo -->
								
								
								
								
								
								
								
								
								
								<xsl:variable name="identifier3" select="id" /> 
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.clients">

									<xsl:for-each select="../../../../associations/association">
										<xsl:if test="$identifier3=idClass1">
											<xsl:call-template name="lineJump"/>
											<xsl:text>              </xsl:text>
											<xsl:element name="JUDE:AssociationPresentation">
												<xsl:attribute name="xmi.idref">
													<xsl:text>associationPresentation_</xsl:text>
													<xsl:value-of select="id" />
												</xsl:attribute>
											</xsl:element>
										</xsl:if>
										<xsl:if test="$identifier3=idClass2">
											<xsl:call-template name="lineJump"/>
											<xsl:text>              </xsl:text>
											<xsl:element name="JUDE:AssociationPresentation">
												<xsl:attribute name="xmi.idref">
													<xsl:text>associationPresentation_</xsl:text>
													<xsl:value-of select="id" />
												</xsl:attribute>
											</xsl:element>
										</xsl:if>
									</xsl:for-each>
								</xsl:element>
								
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.customStyleMap">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:UPresentation.styleProperty">
										<xsl:attribute name="key">
											<xsl:text>attribute.filter_by_visibility</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="value">
											<xsl:text></xsl:text>
										</xsl:attribute>
									</xsl:element>
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:UPresentation.styleProperty">
										<xsl:attribute name="key">
											<xsl:text>operation.filter_by_visibility</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="value">
											<xsl:text></xsl:text>
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:JomtPresentation.location">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>377.0</xsl:text>
									</xsl:element>
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>93.0</xsl:text>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:for-each>
						
					
						
						
						
						<xsl:for-each select="./dependencies/dependency">
							<xsl:call-template name="lineJump"/>
							<xsl:text>          </xsl:text>
							<xsl:element name="JUDE:DependencyPresentation">
								<xsl:attribute name="xmi.id">
									<xsl:text>dependencyPresentation_</xsl:text>
									<xsl:value-of select="id" />
								</xsl:attribute>
								<xsl:attribute name="version">
									<xsl:text>0</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="depth">
									<xsl:text>2147483633</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="stereotypeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="constraintVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="notationType">
									<xsl:text>0</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="rightAngle">
									<xsl:text>false</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="visibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.semanticModel">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="UML:Dependency">
										<xsl:attribute name="xmi.idref">
											<xsl:value-of select="id" />
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.diagram">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:Diagram">
										<xsl:attribute name="xmi.idref">
											<xsl:text>Class_Diagram</xsl:text>
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.servers">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:ClassifierPresentation">
										<xsl:attribute name="xmi.idref">
											<xsl:text>classifierPresentation_</xsl:text>
											<xsl:value-of select="idClass2" />
										</xsl:attribute>
									</xsl:element>
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:ClassifierPresentation">
										<xsl:attribute name="xmi.idref">
											<xsl:text>classifierPresentation_</xsl:text>
											<xsl:value-of select="idClass1" />
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.customStyleMap">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:UPresentation.styleProperty">
										<xsl:attribute name="key">
											<xsl:text>line.shape</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="value">
											<xsl:text>line</xsl:text>
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:JomtPresentation.location">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.0</xsl:text>
									</xsl:element>
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.0</xsl:text>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:PathPresentation.namePresentation">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:LabelPresentation">
										<xsl:attribute name="xmi.id">
											<xsl:text>LabelPresentationDependency_</xsl:text>
											<xsl:value-of select="id" />
										</xsl:attribute>
										<xsl:attribute name="version">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="depth">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="stereotypeVisibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="constraintVisibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="notationType">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="width">
											<xsl:text>11.0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="height">
											<xsl:text>15.09375</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="doAutoResize">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="visibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:call-template name="lineJump"/>
										<xsl:text>                </xsl:text>
										<xsl:element name="JUDE:JomtPresentation.location">
											<xsl:call-template name="lineJump"/>
											<xsl:text>                  </xsl:text>
											<xsl:element name="XMI.field">
												<xsl:text>284.5</xsl:text>
											</xsl:element>
											<xsl:call-template name="lineJump"/>
											<xsl:text>                  </xsl:text>
											<xsl:element name="XMI.field">
												<xsl:text>134.5</xsl:text>
											</xsl:element>
										</xsl:element>
										<xsl:call-template name="lineJump"/>
										<xsl:text>                </xsl:text>
										<xsl:element name="JUDE:JomtPresentation.compositeParent">
											<xsl:call-template name="lineJump"/>
											<xsl:text>                  </xsl:text>
											<xsl:element name="JUDE:UPresentation">
												<xsl:attribute name="xmi.idref">
													<xsl:text>dependencyPresentation_</xsl:text>
													<xsl:value-of select="id" />
												</xsl:attribute>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:BinaryRelationPresentation.sourceEnd">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.5</xsl:text>
									</xsl:element>
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.5</xsl:text>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:BinaryRelationPresentation.targetEnd">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.5</xsl:text>
									</xsl:element>
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.5</xsl:text>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:PathPresentation.points">
								</xsl:element>
							</xsl:element>
						</xsl:for-each>
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						<xsl:for-each select="./associations/association">
							<xsl:call-template name="lineJump"/>
							<xsl:text>          </xsl:text>
							<xsl:element name="JUDE:AssociationPresentation">
								<xsl:attribute name="xmi.id">
									<xsl:text>associationPresentation_</xsl:text>
									<xsl:value-of select="id" />
								</xsl:attribute>
								<xsl:attribute name="version">
									<xsl:text>0</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="depth">
									<xsl:text>2147483633</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="stereotypeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="constraintVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="notationType">
									<xsl:text>0</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="rightAngle">
									<xsl:text>false</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="visibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="qualifierBoxATypeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="qualifierBoxBTypeVisibility">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="nameDirectionVisible">
									<xsl:text>true</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="nameDirectionReverse">
									<xsl:text>0</xsl:text>
								</xsl:attribute>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.semanticModel">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:Association">
										<xsl:attribute name="xmi.idref">
											<xsl:value-of select="id" />
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.diagram">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:Diagram">
										<xsl:attribute name="xmi.idref">
											<xsl:text>Class_Diagram</xsl:text>
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.servers">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:ClassifierPresentation">
										<xsl:attribute name="xmi.idref">
											<xsl:text>classifierPresentation_</xsl:text>
											<xsl:value-of select="idClass1" />
										</xsl:attribute>
									</xsl:element>
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:ClassifierPresentation">
										<xsl:attribute name="xmi.idref">
											<xsl:text>classifierPresentation_</xsl:text>
											<xsl:value-of select="idClass2" />
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:UPresentation.customStyleMap">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:UPresentation.styleProperty">
										<xsl:attribute name="key">
											<xsl:text>line.shape</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="value">
											<xsl:text>line</xsl:text>
										</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:JomtPresentation.location">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.0</xsl:text>
									</xsl:element>
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.0</xsl:text>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:PathPresentation.namePresentation">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:LabelPresentation">
										<xsl:attribute name="xmi.id">
											<xsl:text>LabelPresentation_</xsl:text>
											<xsl:value-of select="id" />
										</xsl:attribute>
										<xsl:attribute name="version">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="depth">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="stereotypeVisibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="constraintVisibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="notationType">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="width">
											<xsl:text>11.0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="height">
											<xsl:text>15.09375</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="doAutoResize">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="visibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:call-template name="lineJump"/>
										<xsl:text>                </xsl:text>
										<xsl:element name="JUDE:JomtPresentation.location">
											<xsl:call-template name="lineJump"/>
											<xsl:text>                  </xsl:text>
											<xsl:element name="XMI.field">
												<xsl:text>284.5</xsl:text>
											</xsl:element>
											<xsl:call-template name="lineJump"/>
											<xsl:text>                  </xsl:text>
											<xsl:element name="XMI.field">
												<xsl:text>134.5</xsl:text>
											</xsl:element>
										</xsl:element>
										<xsl:call-template name="lineJump"/>
										<xsl:text>                </xsl:text>
										<xsl:element name="JUDE:JomtPresentation.compositeParent">
											<xsl:call-template name="lineJump"/>
											<xsl:text>                  </xsl:text>
											<xsl:element name="JUDE:UPresentation">
												<xsl:attribute name="xmi.idref">
													<xsl:text>associationPresentation_</xsl:text>
													<xsl:value-of select="id" />
												</xsl:attribute>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:BinaryRelationPresentation.sourceEnd">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.5</xsl:text>
									</xsl:element>
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.5</xsl:text>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:BinaryRelationPresentation.targetEnd">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.5</xsl:text>
									</xsl:element>
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="XMI.field">
										<xsl:text>0.5</xsl:text>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:PathPresentation.points">
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:AssociationPresentation.qualifierBoxAPresentation">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:QualifierBoxPresentation">
										<xsl:attribute name="xmi.id">
											<xsl:text>QualifierBoxAPresentation_</xsl:text>
											<xsl:value-of select="id" />
										</xsl:attribute>
										<xsl:attribute name="version">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="depth">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="stereotypeVisibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="constraintVisibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="notationType">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="width">
											<xsl:text>0.0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="height">
											<xsl:text>0.0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="doAutoResize">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="visibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:call-template name="lineJump"/>
										<xsl:text>              </xsl:text>
										<xsl:element name="JUDE:JomtPresentation.location">
											<xsl:call-template name="lineJump"/>
											<xsl:text>                </xsl:text>
											<xsl:element name="XMI.field">
												<xsl:text>201.0</xsl:text>
											</xsl:element>
											<xsl:call-template name="lineJump"/>
											<xsl:text>                </xsl:text>
											<xsl:element name="XMI.field">
												<xsl:text>112.94031762295081</xsl:text>
											</xsl:element>
										</xsl:element>
										<xsl:call-template name="lineJump"/>
										<xsl:text>              </xsl:text>
										<xsl:element name="JUDE:JomtPresentation.compositeParent">
											<xsl:call-template name="lineJump"/>
											<xsl:text>                </xsl:text>
											<xsl:element name="JUDE:UPresentation">
												<xsl:attribute name="xmi.idref">
													<xsl:text>associationPresentation_</xsl:text>
													<xsl:value-of select="id" />
												</xsl:attribute>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
								<xsl:call-template name="lineJump"/>
								<xsl:text>            </xsl:text>
								<xsl:element name="JUDE:AssociationPresentation.qualifierBoxBPresentation">
									<xsl:call-template name="lineJump"/>
									<xsl:text>              </xsl:text>
									<xsl:element name="JUDE:QualifierBoxPresentation">
										<xsl:attribute name="xmi.id">
											<xsl:text>QualifierBoxBPresentation_</xsl:text>
											<xsl:value-of select="id" />
										</xsl:attribute>
										<xsl:attribute name="version">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="depth">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="stereotypeVisibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="constraintVisibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="notationType">
											<xsl:text>0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="width">
											<xsl:text>0.0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="height">
											<xsl:text>0.0</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="doAutoResize">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="visibility">
											<xsl:text>true</xsl:text>
										</xsl:attribute>
										<xsl:call-template name="lineJump"/>
										<xsl:text>              </xsl:text>
										<xsl:element name="JUDE:JomtPresentation.location">
											<xsl:call-template name="lineJump"/>
											<xsl:text>                </xsl:text>
											<xsl:element name="XMI.field">
												<xsl:text>339.0</xsl:text>
											</xsl:element>
											<xsl:call-template name="lineJump"/>
											<xsl:text>                </xsl:text>
											<xsl:element name="XMI.field">
												<xsl:text>123.15343237704917</xsl:text>
											</xsl:element>
										</xsl:element>
										<xsl:call-template name="lineJump"/>
										<xsl:text>              </xsl:text>
										<xsl:element name="JUDE:JomtPresentation.compositeParent">
											<xsl:call-template name="lineJump"/>
											<xsl:text>                </xsl:text>
											<xsl:element name="JUDE:UPresentation">
												<xsl:attribute name="xmi.idref">
													<xsl:text>associationPresentation_</xsl:text>
													<xsl:value-of select="id" />
												</xsl:attribute>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:for-each>
						
						
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>        </xsl:text>
					<xsl:element name="JUDE:Diagram.customStyleMap">
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>private.attribute.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>package.operation.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>attribute.stereotype.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>protected.operation.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>operation.parameter.directionkind.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>false</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>attribute.type.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>operation.compartment.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>attribute.initial.value.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>attribute.compartment.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>operation.return.type.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>operation.parameter.type.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>private.operation.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>public.operation.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>operation.stereotype.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>operation.constraint.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>package.attribute.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>visibility.kind.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>protected.attribute.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>operation.parameter.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>public.attribute.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
						<xsl:call-template name="lineJump"/>
						<xsl:text>          </xsl:text>
						<xsl:element name="JUDE:Diagram.styleProperty">
							<xsl:attribute name="key">
								<xsl:text>attribute.constraint.visibility</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:text>true</xsl:text>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
				</xsl:element>				
			</xsl:element>
		</xsl:for-each>
	</xsl:template>



<xsl:template name=	"lineJump">
<xsl:text>
</xsl:text>
</xsl:template>



<xsl:template name=	"includeAttributes">
	<xsl:for-each select="./attributes/attribute">
		<xsl:call-template name="lineJump"/>
		<xsl:text>            </xsl:text>
		<xsl:element name="UML:Attribute">
			<xsl:attribute name="xmi.id">
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
			<xsl:attribute name="ownerScope">
				<xsl:text>instance</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="targetScope">
				<xsl:text>instance</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="changeability">
				<xsl:text>changeable</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="lineJump"/>
			<xsl:text>              </xsl:text>
			<xsl:element name="UML:ModelElement.namespace">
				<xsl:call-template name="lineJump"/>
				<xsl:text>                </xsl:text>
				<xsl:element name="UML:Namespace">
					<xsl:attribute name="xmi.idref">
						<xsl:value-of select="../../id" />
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
			<xsl:call-template name="lineJump"/>
			<xsl:text>              </xsl:text>
			<xsl:element name="UML:ModelElement.visibility">
				<xsl:attribute name="xmi.value">
					<xsl:text>private</xsl:text>
				</xsl:attribute>
			</xsl:element>
			
			
			<xsl:call-template name="lineJump"/>
			<xsl:text>              </xsl:text>
			<xsl:element name="UML:ModelElement.stereotype">
			
				<xsl:for-each select="./concerns/concern">
					<xsl:call-template name="lineJump"/>
					<xsl:text>                </xsl:text>
					<xsl:element name="UML:Stereotype">
						<xsl:attribute name="xmi.idref">
							<xsl:text>stereotype_</xsl:text>
							<xsl:value-of select="id" />
							<xsl:text>_</xsl:text>
							<xsl:value-of select="../../id" />
						</xsl:attribute>
					</xsl:element>
				</xsl:for-each>
				
			</xsl:element>
			
			
			
			<xsl:call-template name="lineJump"/>							
			<xsl:text>              </xsl:text>
			<xsl:element name="UML:Feature.owner">
				<xsl:call-template name="lineJump"/>
				<xsl:text>                </xsl:text>
				<xsl:element name="UML:Classifier">
					<xsl:attribute name="xmi.idref">
						<xsl:value-of select="../../id" />
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
			<xsl:call-template name="lineJump"/>
			<xsl:text>              </xsl:text>
			<xsl:element name="UML:Feature.visibility">
				<xsl:attribute name="xmi.value">
					<xsl:text>private</xsl:text>
				</xsl:attribute>
			</xsl:element>
			<xsl:call-template name="lineJump"/>
			<xsl:text>              </xsl:text>
			<xsl:element name="UML:StructuralFeature.type">
				<xsl:call-template name="lineJump"/>
				<xsl:text>                </xsl:text>
				<xsl:element name="UML:Classifier">
					<xsl:attribute name="xmi.idref">
						<xsl:choose>
							<xsl:when test="./type/id='String'">
								<xsl:text>1071c84-fed3deb566-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>

							<xsl:when test="./type/id='Boolean'">
								<xsl:text>1071c84-fed3deb550-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Byte'">
								<xsl:text>1071c84-fed3deb552-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Character'">
								<xsl:text>1071c84-fed3deb554-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Double'">
								<xsl:text>1071c84-fed3deb4ee-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Float'">
								<xsl:text>1071c84-fed3deb558-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Integer'">
								<xsl:text>1071c84-fed3deb55a-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Long'">
								<xsl:text>1071c84-fed3deb55c-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Short'">
								<xsl:text>1071c84-fed3deb564-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Math'">
								<xsl:text>1071c84-fed3deb55e-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Number'">
								<xsl:text>1071c84-fed3deb560-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Object'">
								<xsl:text>1071c84-fed3deb562-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='StringBuffer'">
								<xsl:text>1071c84-fed3deb568-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='System'">
								<xsl:text>1071c84-fed3deb56a-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Thread'">
								<xsl:text>1071c84-fed3deb56c-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Throwable'">
								<xsl:text>1071c84-fed3deb56e-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Exception'">
								<xsl:text>1071c84-fed3deb575-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='ArrayList'">
								<xsl:text>1071c84-fed3deb4f6-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Arrays'">
								<xsl:text>1071c84-fed3deb4f8-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='BitSet'">
								<xsl:text>1071c84-fed3deb4fa-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Calendar'">
								<xsl:text>1071c84-fed3deb4fc-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Collections'">
								<xsl:text>1071c84-fed3deb501-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Currency'">
								<xsl:text>1071c84-fed3deb506-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Date'">
								<xsl:text>1071c84-fed3deb508-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Dictionary'">
								<xsl:text>1071c84-fed3deb50a-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='EventListenerProxy'">
								<xsl:text>1071c84-fed3deb512-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='EventObject'">
								<xsl:text>1071c84-fed3deb514-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='HashMap'">
								<xsl:text>1071c84-fed3deb516-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='HashSet'">
								<xsl:text>1071c84-fed3deb518-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Hashtable'">
								<xsl:text>1071c84-fed3deb51a-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='IdentityHashMap'">
								<xsl:text>1071c84-fed3deb51c-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='LinkedHashMap'">
								<xsl:text>1071c84-fed3deb521-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='LinkedHashSet'">
								<xsl:text>1071c84-fed3deb523-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='LinkedList'">
								<xsl:text>1071c84-fed3deb525-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Observable'">
								<xsl:text>1071c84-fed3deb530-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Stack'">
								<xsl:text>1071c84-fed3deb53e-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='StringTokenizer'">
								<xsl:text>1071c84-fed3deb540-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='TreeMap'">
								<xsl:text>1071c84-fed3deb542-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='TreeSet'">
								<xsl:text>1071c84-fed3deb544-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='Vector'">
								<xsl:text>1071c84-fed3deb546-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:when test="./type/id='WeakHashMap'">
								<xsl:text>1071c84-fed3deb548-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>





							<xsl:otherwise>
								<xsl:if test="./type/primitive='true'">
									<xsl:value-of select="./type/id" />
								</xsl:if>
								<xsl:if test="./type/primitive='false'">
									<xsl:if test="./type/user='false'">
										<xsl:text>packages_</xsl:text>
										<xsl:value-of select="./type/id" />
									</xsl:if>
									<xsl:if test="./type/user='true'">
										<xsl:value-of select="./type/id" />
									</xsl:if>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:element>
				<xsl:call-template name="lineJump"/>
			</xsl:element>
			<xsl:call-template name="lineJump"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>



<xsl:template name=	"includeOperations">
	<xsl:for-each select="./operations/operation">
		<xsl:call-template name="lineJump"/>
		<xsl:text>            </xsl:text>
		<xsl:element name="UML:Operation">
			<xsl:attribute name="xmi.id">
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
			<xsl:attribute name="ownerScope">
				<xsl:text>instance</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="isQuery">
				<xsl:text>true</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="concurrency">
				<xsl:text>sequential</xsl:text>
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
			<xsl:call-template name="lineJump"/>
			<xsl:text>              </xsl:text>
			<xsl:element name="UML:ModelElement.namespace">
				<xsl:call-template name="lineJump"/>
				<xsl:text>                </xsl:text>
				<xsl:element name="UML:Namespace">
					<xsl:attribute name="xmi.idref">
						<xsl:value-of select="../../id" />
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
			
			
			
			
			<xsl:if test="./returnType/id=''">
				<xsl:element name="UML:ModelElement.taggedValue">
					<xsl:element name="UML:TaggedValue">
						<xsl:attribute name="xmi.id">
							<xsl:value-of select="id" />
							<xsl:text>_void</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="version">
							<xsl:text>0</xsl:text>
						</xsl:attribute>
						<xsl:element name="UML:TaggedValue.modelElement">
							<xsl:element name="UML:ModelElement">
								<xsl:attribute name="xmi.idref">
									<xsl:value-of select="id" />
								</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			
			
			
			
			
			
			<xsl:call-template name="lineJump"/>
			<xsl:text>          </xsl:text>
			<xsl:element name="UML:ModelElement.stereotype">
			
				<xsl:for-each select="./concerns/concern">
					<xsl:call-template name="lineJump"/>
					<xsl:text>            </xsl:text>
					<xsl:element name="UML:Stereotype">
						<xsl:attribute name="xmi.idref">
							<xsl:text>stereotype_</xsl:text>
							<xsl:value-of select="id" />
							<xsl:text>_</xsl:text>
							<xsl:value-of select="../../id" />
						</xsl:attribute>
					</xsl:element>
				</xsl:for-each>
				
			</xsl:element>
			
	
			<xsl:call-template name="lineJump"/>
			<xsl:text>              </xsl:text>
			<xsl:element name="UML:Feature.owner">
				<xsl:call-template name="lineJump"/>
				<xsl:text>                </xsl:text>
				<xsl:element name="UML:Classifier">
					<xsl:attribute name="xmi.idref">
						<xsl:value-of select="../../id" />
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
			
			<xsl:call-template name="lineJump"/>
			<xsl:text>              </xsl:text>
			<xsl:element name="UML:Feature.visibility">
				<xsl:attribute name="xmi.value">
					<xsl:text>public</xsl:text>
				</xsl:attribute>
			</xsl:element>
			
			
			<xsl:call-template name="lineJump"/>
			<xsl:text>              </xsl:text>
			<xsl:element name="UML:BehavioralFeature.parameter">

				<xsl:if test="./returnType/id!=''">
					<xsl:call-template name="lineJump"/>
					<xsl:text>                </xsl:text>
					<xsl:call-template name="includeReturnParameters"/>

				</xsl:if>		
				
				<xsl:call-template name="includeParameters"/>

			</xsl:element>

		</xsl:element>		
	</xsl:for-each>
</xsl:template>



<xsl:template name=	"includeReturnParameters">
	<xsl:element name="UML:Parameter">
		<xsl:attribute name="xmi.id">
			<xsl:text>return_</xsl:text>
			<xsl:value-of select="id" />
		</xsl:attribute>
		<xsl:attribute name="name">
			<xsl:text></xsl:text>
		</xsl:attribute>
		<xsl:attribute name="version">
			<xsl:text>0</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="unSolvedFlag">
			<xsl:text>false</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="kind">
			<xsl:text>return</xsl:text>
		</xsl:attribute>
		<xsl:call-template name="lineJump"/>
		<xsl:text>                  </xsl:text>
		<xsl:element name="UML:ModelElement.namespace">
			<xsl:call-template name="lineJump"/>
			<xsl:text>                    </xsl:text>
			<xsl:element name="UML:Namespace">
				<xsl:attribute name="xmi.idref">
					<xsl:value-of select="../../id" />
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
		
		<xsl:call-template name="lineJump"/>
		<xsl:text>                  </xsl:text>
		<xsl:element name="UML:Parameter.behavioralFeature">
			<xsl:call-template name="lineJump"/>
			<xsl:text>                    </xsl:text>
			<xsl:element name="UML:BehavioralFeature">
				<xsl:attribute name="xmi.idref">
					<xsl:value-of select="id" />
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
		
		<xsl:call-template name="lineJump"/>
		<xsl:text>                  </xsl:text>
		<xsl:element name="UML:Parameter.type">
			<xsl:call-template name="lineJump"/>
			<xsl:text>                    </xsl:text>
			<xsl:element name="UML:Classifier">
				<xsl:attribute name="xmi.idref">
					<xsl:choose>
						<xsl:when test="./returnType/id='String'">
							<xsl:text>1071c84-fed3deb566-e12556edfc4798525298ccf2388f7db7</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="./returnType/id=../../id">
								<xsl:value-of select="../../id" />
							</xsl:if>
							<xsl:if test="./returnType/id!=../../id">
								<xsl:if test="./returnType/primitive='true'">
									<xsl:value-of select="./returnType/id" />
								</xsl:if>
								<xsl:if test="./returnType/primitive='false'">
								
									<xsl:if test="./returnType/user='false'">
										<xsl:text>packages_</xsl:text>
										<xsl:value-of select="./returnType/id" />
									</xsl:if>
									<xsl:if test="./returnType/user='true'">
										<xsl:value-of select="./returnType/id" />
									</xsl:if>
								</xsl:if>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:element>
</xsl:template>



<xsl:template name=	"includeParameters">
	<xsl:for-each select="./parameters/parameter">
		<xsl:call-template name="lineJump"/>
		<xsl:text>                </xsl:text>
		<xsl:element name="UML:Parameter">
			<xsl:attribute name="xmi.id">
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
			<xsl:attribute name="kind">
				<xsl:text>in</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="lineJump"/>
			<xsl:text>                  </xsl:text>
			<xsl:element name="UML:ModelElement.namespace">
				<xsl:call-template name="lineJump"/>
				<xsl:text>                    </xsl:text>
				<xsl:element name="UML:Namespace">
					<xsl:attribute name="xmi.idref">
						<xsl:value-of select="../../../../id" />
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
	
			<xsl:call-template name="lineJump"/>
			<xsl:text>                  </xsl:text>
			<xsl:element name="UML:Parameter.behavioralFeature">
				<xsl:call-template name="lineJump"/>
				<xsl:text>                    </xsl:text>
				<xsl:element name="UML:BehavioralFeature">
					<xsl:attribute name="xmi.idref">
						<xsl:value-of select="../../id" />
					</xsl:attribute>
				</xsl:element>
			</xsl:element>

			<xsl:call-template name="lineJump"/>
			<xsl:text>                  </xsl:text>
			<xsl:element name="UML:Parameter.type">
				<xsl:call-template name="lineJump"/>
				<xsl:text>                    </xsl:text>
				<xsl:element name="UML:Classifier">
					<xsl:attribute name="xmi.idref">
						<xsl:choose>
							<xsl:when test="./type/id='String'">
								<xsl:text>1071c84-fed3deb566-e12556edfc4798525298ccf2388f7db7</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="./type/id=../../../../id">
									<xsl:value-of select="../../../../id" />
								</xsl:if>
								<xsl:if test="./type/id!=../../../../id">
									<xsl:if test="./type/primitive='true'">
										<xsl:value-of select="./type/id" />
									</xsl:if>
									<xsl:if test="./type/primitive='false'">
									
										<xsl:if test="./type/user='false'">
											<xsl:text>packages_</xsl:text>
											<xsl:value-of select="./type/id" />
										</xsl:if>
										<xsl:if test="./type/user='true'">
											<xsl:value-of select="./type/id" />
										</xsl:if>

									</xsl:if>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:for-each>
</xsl:template>



<xsl:template name=	"includeStereotypesInClass">

	<xsl:call-template name="lineJump"/>
	<xsl:text>        </xsl:text>
	<xsl:element name="UML:Stereotype">
		<xsl:attribute name="xmi.id">
			<xsl:text>stereotype_</xsl:text>
			<xsl:value-of select="id" />
			<xsl:text>_</xsl:text>
			<xsl:value-of select="../../id" />
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
		<xsl:call-template name="lineJump"/>
		<xsl:text>          </xsl:text>
		<xsl:element name="UML:Stereotype.baseClass">
			<xsl:text>Class</xsl:text>
		</xsl:element>
		<xsl:call-template name="lineJump"/>
		<xsl:text>          </xsl:text>
		<xsl:element name="UML:Stereotype.extendedElement">
			<xsl:call-template name="lineJump"/>
			<xsl:text>            </xsl:text>
			<xsl:element name="UML:ModelElement">
				<xsl:attribute name="xmi.idref">
					<xsl:value-of select="../../id" />
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:element>
	
</xsl:template>



<xsl:template name=	"includeStereotypesInAttribute">
	<xsl:call-template name="lineJump"/>
	<xsl:text>        </xsl:text>
	<xsl:element name="UML:Stereotype">
		<xsl:attribute name="xmi.id">
			<xsl:text>stereotype_</xsl:text>
			<xsl:value-of select="id" />
			<xsl:text>_</xsl:text>
			<xsl:value-of select="../../id" />
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
		<xsl:call-template name="lineJump"/>
		<xsl:text>          </xsl:text>
		<xsl:element name="UML:Stereotype.baseClass">
			<xsl:text>Attribute</xsl:text>
		</xsl:element>
		<xsl:call-template name="lineJump"/>
		<xsl:text>          </xsl:text>
		<xsl:element name="UML:Stereotype.extendedElement">
			<xsl:call-template name="lineJump"/>
			<xsl:text>            </xsl:text>
			<xsl:element name="UML:ModelElement">
				<xsl:attribute name="xmi.idref">
					<xsl:value-of select="../../id" />
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:element>
</xsl:template>



<xsl:template name=	"includeStereotypesInOperation">
	<xsl:call-template name="lineJump"/>
	<xsl:text>        </xsl:text>
	<xsl:element name="UML:Stereotype">
		<xsl:attribute name="xmi.id">
			<xsl:text>stereotype_</xsl:text>
			<xsl:value-of select="id" />
			<xsl:text>_</xsl:text>
			<xsl:value-of select="../../id" />
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
		<xsl:call-template name="lineJump"/>
		<xsl:text>          </xsl:text>
		<xsl:element name="UML:Stereotype.baseClass">
			<xsl:text>Operation</xsl:text>
		</xsl:element>
		<xsl:call-template name="lineJump"/>
		<xsl:text>          </xsl:text>
		<xsl:element name="UML:Stereotype.extendedElement">
			<xsl:call-template name="lineJump"/>
			<xsl:text>            </xsl:text>
			<xsl:element name="UML:ModelElement">
				<xsl:attribute name="xmi.idref">
					<xsl:value-of select="../../id" />
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:element>
</xsl:template>



<xsl:template name=	"includeStereotypesInDependency">
	<xsl:call-template name="lineJump"/>
	<xsl:text>        </xsl:text>
	<xsl:element name="UML:Stereotype">
		<xsl:attribute name="xmi.id">
			<xsl:text>stereotype_</xsl:text>
			<xsl:value-of select="id" />
			<xsl:text>_</xsl:text>
			<xsl:value-of select="../../id" />
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
		<xsl:call-template name="lineJump"/>
		<xsl:text>          </xsl:text>
		<xsl:element name="UML:Stereotype.baseClass">
			<xsl:text>Dependency</xsl:text>
		</xsl:element>
		<xsl:call-template name="lineJump"/>
		<xsl:text>          </xsl:text>
		<xsl:element name="UML:Stereotype.extendedElement">
			<xsl:call-template name="lineJump"/>
			<xsl:text>            </xsl:text>
			<xsl:element name="UML:ModelElement">
				<xsl:attribute name="xmi.idref">
					<xsl:value-of select="../../id" />
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
	</xsl:element>
</xsl:template>



<xsl:template name=	"includeDependencies">
	<xsl:for-each select="./dependencies/dependency">
		<xsl:call-template name="lineJump"/>
		<xsl:text>        </xsl:text>
		<xsl:element name="UML:Dependency">
			<xsl:attribute name="xmi.id">
				<xsl:value-of select="id" />
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:text></xsl:text>
			</xsl:attribute>
			<xsl:attribute name="version">
				<xsl:text>0</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="unSolvedFlag">
				<xsl:text>false</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="description">
				<xsl:text></xsl:text>
			</xsl:attribute>
			<xsl:call-template name="lineJump"/>
			<xsl:text>        </xsl:text>
			<xsl:element name="UML:ModelElement.namespace">
				<xsl:call-template name="lineJump"/>
				<xsl:text>        </xsl:text>
				<xsl:element name="UML:Namespace">
					<xsl:attribute name="xmi.idref">
						<xsl:text>0-fxdi7ror--vt5o6g--zcej9x-4fa0256f5c54d6d1903568de23302b4c</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
			<xsl:call-template name="lineJump"/>
			<xsl:text>        </xsl:text>
			<xsl:element name="UML:ModelElement.visibility">
				<xsl:attribute name="xmi.value">
					<xsl:text>public</xsl:text>
				</xsl:attribute>
			</xsl:element>
			
			
			<xsl:call-template name="lineJump"/>
			<xsl:text>        </xsl:text>
			<xsl:element name="UML:ModelElement.stereotype">
				<xsl:for-each select="./concerns/concern">
					<xsl:call-template name="lineJump"/>
					<xsl:text>          </xsl:text>
					<xsl:element name="UML:Stereotype">
						<xsl:attribute name="xmi.idref">
							<xsl:text>stereotype_</xsl:text>
							<xsl:value-of select="id" />
							<xsl:text>_</xsl:text>
							<xsl:value-of select="../../id" />
						</xsl:attribute>
					</xsl:element>
				</xsl:for-each>			
			</xsl:element>
			
			
			
			
			<xsl:call-template name="lineJump"/>
			<xsl:text>        </xsl:text>
			<xsl:element name="UML:Dependency.client">
				<xsl:call-template name="lineJump"/>
				<xsl:text>        </xsl:text>
				<xsl:element name="UML:ModelElement">
					<xsl:attribute name="xmi.idref">
						<xsl:value-of select="idClass1" />
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
			<xsl:call-template name="lineJump"/>
			<xsl:text>        </xsl:text>
			<xsl:element name="UML:Dependency.supplier">
				<xsl:call-template name="lineJump"/>
				<xsl:text>        </xsl:text>
				<xsl:element name="UML:ModelElement">
					<xsl:attribute name="xmi.idref">
						<xsl:value-of select="idClass2" />
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:for-each>
</xsl:template>



<xsl:template name=	"includeAssociations">
	<xsl:for-each select="./associations/association">
		<xsl:call-template name="lineJump"/>
		<xsl:text>        </xsl:text>
		<xsl:element name="UML:Association">
			<xsl:attribute name="xmi.id">
				<xsl:value-of select="id" />
			</xsl:attribute>
			<xsl:attribute name="name">
				<xsl:text></xsl:text>
			</xsl:attribute>
			<xsl:attribute name="version">
				<xsl:text>0</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="unSolvedFlag">
				<xsl:text>false</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="lineJump"/>
			<xsl:text>          </xsl:text>
			<xsl:element name="UML:ModelElement.namespace">
				<xsl:call-template name="lineJump"/>
				<xsl:text>            </xsl:text>
				<xsl:element name="UML:Namespace">
					<xsl:attribute name="xmi.id">
						<xsl:text>0-fxdi7ror--vt5o6g--zcej9x-4fa0256f5c54d6d1903568de23302b4c</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
			<xsl:call-template name="lineJump"/>
			<xsl:text>          </xsl:text>
			<xsl:element name="UML:ModelElement.visibility">
				<xsl:attribute name="xmi.value">
					<xsl:text>public</xsl:text>
				</xsl:attribute>
			</xsl:element>
			<xsl:call-template name="lineJump"/>
			<xsl:text>          </xsl:text>
			<xsl:element name="UML:Association.connection">
				<xsl:call-template name="lineJump"/>
				<xsl:text>            </xsl:text>
				<xsl:element name="UML:AssociationEnd">
					<xsl:attribute name="xmi.id">
						<xsl:value-of select="id" />
						<xsl:text>_First</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:text></xsl:text>
					</xsl:attribute>
					<xsl:attribute name="version">
						<xsl:text>0</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="unSolvedFlag">
						<xsl:text>false</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="ownerScope">
						<xsl:text>instance</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="targetScope">
						<xsl:text>instance</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="changeability">
						<xsl:text>changeable</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="aggregation">
						<xsl:text>none</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="ordering">
						<xsl:text>unordered</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="navigableType">
						<xsl:text>unspecified navigable</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="isNavigable">
						<xsl:text>false</xsl:text>
					</xsl:attribute>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:ModelElement.namespace">
						<xsl:call-template name="lineJump"/>
						<xsl:text>                </xsl:text>
						<xsl:element name="UML:Namespace">
							<xsl:attribute name="xmi.idref">
								<xsl:text>0-fxdi7ror--vt5o6g--zcej9x-4fa0256f5c54d6d1903568de23302b4c</xsl:text>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:ModelElement.visibility">
						<xsl:attribute name="xmi.value">
							<xsl:text>private</xsl:text>
						</xsl:attribute>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:Feature.owner">
						<xsl:call-template name="lineJump"/>
						<xsl:text>                </xsl:text>
						<xsl:element name="UML:Classifier">
							<xsl:attribute name="xmi.idref">
								<xsl:value-of select="idClass2" />
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:Feature.visibility">
						<xsl:attribute name="xmi.value">
							<xsl:text>private</xsl:text>
						</xsl:attribute>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:StructuralFeature.multiplicity">
						<xsl:call-template name="lineJump"/>
						<xsl:text>                </xsl:text>
						<xsl:element name="UML:Multiplicity">
							<xsl:attribute name="xmi.id">
								<xsl:text>Multiplicity_</xsl:text>
								<xsl:value-of select="id" />
								<xsl:text>_</xsl:text>
								<xsl:value-of select="idClass2" />
							</xsl:attribute>
							<xsl:call-template name="lineJump"/>
							<xsl:text>                  </xsl:text>
							<xsl:element name="UML:Multiplicity.range">
								<xsl:call-template name="lineJump"/>
								<xsl:text>                    </xsl:text>
								<xsl:element name="UML:MultiplicityRange">
									<xsl:attribute name="xmi.id">
										<xsl:text>MultiplicityRange_</xsl:text>
										<xsl:value-of select="id" />
										<xsl:text>_</xsl:text>
										<xsl:value-of select="idClass2" />
									</xsl:attribute>
									<xsl:attribute name="lowerValue">
										<xsl:text></xsl:text>
									</xsl:attribute>
									<xsl:attribute name="upperValue">
										<xsl:text></xsl:text>
									</xsl:attribute>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:AssociationEnd.participant">
						<xsl:call-template name="lineJump"/>
						<xsl:text>                </xsl:text>
						<xsl:element name="UML:Classifier">
							<xsl:attribute name="xmi.idref">
								<xsl:value-of select="idClass1" />
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:AssociationEnd.association">
						<xsl:call-template name="lineJump"/>
						<xsl:text>                </xsl:text>
						<xsl:element name="UML:Association">
							<xsl:attribute name="xmi.idref">
								<xsl:value-of select="id" />
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:AssociationEnd.visibility">
						<xsl:attribute name="xmi.value">
							<xsl:text>private</xsl:text>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:call-template name="lineJump"/>
				<xsl:text>            </xsl:text>
				<xsl:element name="UML:AssociationEnd">
					<xsl:attribute name="xmi.id">
						<xsl:value-of select="id" />
						<xsl:text>_Second</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:text></xsl:text>
					</xsl:attribute>
					<xsl:attribute name="version">
						<xsl:text>0</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="unSolvedFlag">
						<xsl:text>false</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="ownerScope">
						<xsl:text>instance</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="targetScope">
						<xsl:text>instance</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="changeability">
						<xsl:text>changeable</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="aggregation">
						<xsl:text>none</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="ordering">
						<xsl:text>unordered</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="navigableType">
						<xsl:text>unspecified navigable</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="isNavigable">
						<xsl:text>false</xsl:text>
					</xsl:attribute>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:ModelElement.namespace">
						<xsl:call-template name="lineJump"/>
						<xsl:text>                </xsl:text>
						<xsl:element name="UML:Namespace">
							<xsl:attribute name="xmi.idref">
								<xsl:text>0-fxdi7ror--vt5o6g--zcej9x-4fa0256f5c54d6d1903568de23302b4c</xsl:text>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:ModelElement.visibility">
						<xsl:attribute name="xmi.value">
							<xsl:text>private</xsl:text>
						</xsl:attribute>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:Feature.owner">
						<xsl:call-template name="lineJump"/>
						<xsl:text>                </xsl:text>
						<xsl:element name="UML:Classifier">
							<xsl:attribute name="xmi.idref">
								<xsl:value-of select="idClass1" />
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:Feature.visibility">
						<xsl:attribute name="xmi.value">
							<xsl:text>private</xsl:text>
						</xsl:attribute>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:StructuralFeature.multiplicity">
						<xsl:call-template name="lineJump"/>
						<xsl:text>                </xsl:text>
						<xsl:element name="UML:Multiplicity">
							<xsl:attribute name="xmi.id">
								<xsl:text>Multiplicity_</xsl:text>
								<xsl:value-of select="id" />
								<xsl:text>_</xsl:text>
								<xsl:value-of select="idClass1" />
							</xsl:attribute>
							<xsl:call-template name="lineJump"/>
							<xsl:text>                  </xsl:text>
							<xsl:element name="UML:Multiplicity.range">
								<xsl:call-template name="lineJump"/>
								<xsl:text>                    </xsl:text>
								<xsl:element name="UML:MultiplicityRange">
									<xsl:attribute name="xmi.id">
										<xsl:text>MultiplicityRange_</xsl:text>
										<xsl:value-of select="id" />
										<xsl:text>_</xsl:text>
										<xsl:value-of select="idClass1" />
									</xsl:attribute>
									<xsl:attribute name="lowerValue">
										<xsl:text></xsl:text>
									</xsl:attribute>
									<xsl:attribute name="upperValue">
										<xsl:text></xsl:text>
									</xsl:attribute>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:AssociationEnd.participant">
						<xsl:call-template name="lineJump"/>
						<xsl:text>                </xsl:text>
						<xsl:element name="UML:Classifier">
							<xsl:attribute name="xmi.idref">
								<xsl:value-of select="idClass2" />
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:AssociationEnd.association">
						<xsl:call-template name="lineJump"/>
						<xsl:text>                </xsl:text>
						<xsl:element name="UML:Association">
							<xsl:attribute name="xmi.idref">
								<xsl:value-of select="id" />
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="lineJump"/>
					<xsl:text>              </xsl:text>
					<xsl:element name="UML:AssociationEnd.visibility">
						<xsl:attribute name="xmi.value">
							<xsl:text>private</xsl:text>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
		<xsl:call-template name="lineJump"/>
		<xsl:text>        </xsl:text>
		<xsl:element name="UML:AssociationEnd">
			<xsl:attribute name="xmi.idref">
				<xsl:value-of select="id" />
				<xsl:text>_First</xsl:text>
			</xsl:attribute>
		</xsl:element>
		<xsl:call-template name="lineJump"/>
		<xsl:text>        </xsl:text>
		<xsl:element name="UML:AssociationEnd">
			<xsl:attribute name="xmi.idref">
				<xsl:value-of select="id" />
				<xsl:text>_Second</xsl:text>
			</xsl:attribute>
		</xsl:element>
	</xsl:for-each>
</xsl:template>



<xsl:template name=	"includePrimitiveTypes">
	<xsl:for-each select="./types/type">
		<xsl:if test="./id!='String'">
			<xsl:if test="./primitive='true'">
				<xsl:if test="./user='false'">
					<xsl:call-template name="lineJump"/>
					<xsl:text>    </xsl:text>
					<xsl:element name="UML:Primitive">
						<xsl:attribute name="xmi.id">
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
					</xsl:element>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:for-each>
</xsl:template>



</xsl:stylesheet>